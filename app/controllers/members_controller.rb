class MembersController < ApplicationController

before_action :set_member
skip_before_action :set_member, only: [:destroy, :create, :index, :new, :oauthorize]
skip_before_action :authenticate_user

	def index
    @members = Member.all
	end
	
	def oauthorize
			resp = Faraday.post("https://api-ssl.bitly.com/oauth/access_token") do |req|
			req.headers['Content-Type'] = 'application/json'
			req.headers['Accept'] = 'application/json'
			req.params['client_id'] = ENV['BITLY_CLIENT_ID']
			req.params['client_secret'] = ENV['BITLY_SECRET']
			req.params['grant_type'] = 'authorization_code'
			req.params['redirect_uri'] = "http://localhost:3000/auth"
			req.params['code'] = params[:code]
		end
		body = JSON.parse(resp.body)
		session[:token] = body["access_token"]
  	redirect_to root_path
	end

  def new
    @member = Member.new
  end

  def create
		@member = Member.create(member_params)
		shortened_weblink = shorten_weblink
		binding.pry
		@member.update(shortened_weblink: shortened_weblink)
    if @member.valid?
      session[:member_id] = @member.id
      redirect_to member_path(@member)
    else
      render :new
    end
  end

	def show
    @member
  end

	def edit
		binding.pry
    if @member.nil?
      redirect_to members_path, alert: "Member not found."
		else
      redirect_to edit_member_path(@member)
    end
  end

  def update
    @member.update(user_params)
    if @member.valid?
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find_by(username: params[:name])
    @member.destroy
    redirect_to '/'
  end

	private
	
	def set_member
    @member = Member.where(id: params[:id]).first
  end

	def member_params
    params.require(:member).permit(:id, :name, :website)
	end
	
	private

	def shorten_weblink
		url = "https://api-ssl.bitly.com/v4/shorten"
		long_url = member_params[:website]
		resp = Faraday.post(url) do |req|
			req.headers['Content-Type'] = 'application/json'
			req.headers['Authorization'] = session[:token]
			req.headers['Accept'] = 'application/json'
			req.body = { 'long_url':  "#{long_url}"}.to_json
		end
		body = JSON.parse(resp.body)
		shortened_link = body["link"]
	end
end
