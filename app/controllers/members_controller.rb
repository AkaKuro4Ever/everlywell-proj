class MembersController < ApplicationController

	def new
    @member = Member.new(member_ids: params[:member_id])
  end

  def create
    @member = Member.create(member_params)
    if @member.invalid?
      render :new
    else
     @member.members << current_member if @member.save
     redirect_to member_path(@member)
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @member}
    end
  end

  def edit
    if params[:member_id]
    @member = member.find_by(id: params[:member_id])
      if @member.nil?
        redirect_to members_path, alert: "Author not found."
      elsif  !@member = @member.members.find_by(id: params[:id])
        redirect_to member_members_path(@member), alert: "member not found."
      else
        redirect_to member_members_path(@member) if logged_in? && !@member.members.find_by(id: current_member.id)
      end
    else
    @post = Post.find(params[:id])
    end
  end

  def update
    @member.update(member_params)
    redirect_to member_path(@member)
  end

  def destroy
    @member.destroy

    redirect_to members_path
  end
end
