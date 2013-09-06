class UserController < ApplicationController
	before_action :find_user , only: [:show, :destroy]

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:reg]=1
		else 
			flash[:reg]=0
		end

	end
	
	def login
		if request.post? 
			@user = User.find_by_user_name(params[:user_name])
			if @user == nil 
				flash.now[:msg]='user '+params[:user_name]+' doesn\'t exists'
			else
				if @user.user_pwd != params[:user_pwd] 
					flash.now[:msg]= 'password wrong'
				else 
					session[:login]=1
					session[:user_name] = @user.user_name
					session[:uid] = @user.id
					session[:admin] = @user.admin
					redirect_to '/user/'+@user.id.to_s
				end
			end
		end
	end

	def logout 
		session[:login]=nil
		redirect_to root_url 
	end
	
	def show
		@orders = @user.orders.all
		@order_info = Array.new	
		@orders.each do |o|
			room = Room.find(o.room_id)	
			place = Place.find(room.place_id)
			@order_info.push(Array[place.name,room.name])
		end
		@order_info.reverse!
	end

	def destroy
		@user.destroy
		redirect_to root_url 
	end

private
	def user_params
		params.require(:user).permit(:user_name ,:user_pwd,:user_mail)
	end

	def find_user
		@user = User.find(params[:id])
	end

end
