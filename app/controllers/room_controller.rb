class RoomController < ApplicationController
	before_action :find_room ,only: [:destroy,:show]
	def create
		@place = Place.find(params[:place_id])	
		@room = @place.rooms.new(room_params)
		if @room.save 
			@time = TimeTable.new
			@time.init(@room.id)
			@time.save
			redirect_to place_url(params[:place_id])
		end
	end

	def destroy
		@place_id = @room.place_id
		@room.destroy
		redirect_to place_url(@place_id)
	end

	def show
		@time = TimeTable.find_by_room_id(@room.id)		
	end

private
	def room_params
		params.require(:room).permit(:name,:info,:place_id)
	end

	def find_room
		@room = Room.find(params[:id])
		@place = Place.find(@room.place_id)
	end
end
