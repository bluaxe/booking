class OrderController < ApplicationController
	before_action :find_user, only: [:new,:create,:destroy]
	before_action :find_order, only: [:destroy]
	def index
	end	

	def new
		@order = Order.new
		@room = Room.find(params[:id])
	end

	def create
		@order = @user.orders.new(order_param)	
		if @order.save
			redirect_to root_url
		end
	end

	def destroy
		@order.destroy
		redirect_to '/user/'+@user.id.to_s
	end

private
	def order_param
		params.require(:order).permit(:room_id,:date,:time,:info)
	end

	def find_user
		@user = User.find(session[:uid])
	end

	def find_order
		@order = Order.find(params[:id])
	end
end
