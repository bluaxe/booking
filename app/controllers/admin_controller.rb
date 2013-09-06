class AdminController < ApplicationController
	before_action :admin? 
	def index
		@users = User.all
	end

	def grant
		@user = User.find(params[:id])
		if @user.admin == nil 
			@user.admin = 1
		end
		@user.admin = 1-@user.admin
		@user.save
		redirect_to admin_url
	end
private 
	def admin?
		if session[:login]!= 1 
			redirect_to login_url
		end
		@user = User.find(session[:uid])
		if @user.admin!=1 
			redirect_to '/user/'+@user.id.to_s
		end
	end
end
