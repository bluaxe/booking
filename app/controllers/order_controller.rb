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

		#check if start time less than end time
		if !(@order.start_time < @order.end_time) 
			flash.now[:msg]="time error"
		else
			# check if the given time in the serve time of this room
			@room = Room.find(@order.room_id)
			@time_table = @room.time_table

			@week = Time.parse(@order.date).strftime('%a').to_s
			@st = @time_table[@week+'_b']
			@et = @time_table[@week+'_e']

			if !(@st <= @order.start_time && @et >=@order.end_time)
				flash.now[:msg]="time not in range"
			else
				#Check if the required time available
				@orders = Order.where(room_id:@order.room_id,date:@order.date)
				@dup = false
				@orders.each do |o|
					if !(@order.end_time < o.start_time || @order.start_time > o.end_time)
						@dup = true
					end
				end
				if @dup 
					flash.now[:msg]="Sorry, this room has been ordered at the time you give us"
				else
					#OK
					if @order.save
						@room = Room.find(@order.room_id)
						redirect_to '/p/'+@room.place_id.to_s
					end
				end
			end

		end
	end

	def destroy
		@order.destroy
		redirect_to '/user/'+@user.id.to_s
	end

private
	def order_param
		params.require(:order).permit(:room_id,:date,:start_time,:end_time,:info)
	end

	def find_user
		if session[:login]!=1 
			redirect_to login_url
		else 
			@user = User.find(session[:uid])
		end	
	end

	def find_order
		@order = Order.find(params[:id])
	end
end
