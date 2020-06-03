class ApplicationController < ActionController::Base
	before_action :authenticate_user

	def index
	end

	private
		def authenticate_user
			client_id = ENV['BITLY_CLIENT_ID']
			redirect_uri = "http://localhost:3000/auth"
			bitly_url = "https://bitly.com/oauth/authorize?client_id=#{client_id}&redirect_uri=#{redirect_uri}"
			redirect_to bitly_url unless oauthenticated?
		end

		def oauthenticated?
			!!session[:token]
		end
		
end
