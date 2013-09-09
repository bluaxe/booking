class UserController < ApplicationController
	before_action :find_user , only: [:show, :destroy]

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		@u = User.find_by_user_name(@user.user_name)
		if @u 
			flash.now[:msg]='User Name already Exists.'
		else
			@user.verified = UserController.rand_str(40)
			send_verify_mail
			if @user.save
				redirect_to '/user/'+@user.id.to_s
			else 
				flash.now[:msg]='Saving Error'
			end
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

	def verify
		@code = params[:code]
		@user = User.find_by_verified(@code)
		if @user!=nil
			@user.verified = "yes"
			@user.save
			flash.now[:verified]= 1
		else 
			flash.now[:verified]= 0
		end
	end


private
	def user_params
		params.require(:user).permit(:user_name ,:user_pwd,:user_mail)
	end

	def find_user
		@user = User.find(params[:id])
	end

	def self.rand_str(len)
		str = ""
		chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a
		1.upto(len){
			|i| 	
			str << chars[rand(chars.size-1)]
		}
		return str
	end

	def send_verify_mail
		UserMailer.welcome_email(@user).deliver
	end

end
