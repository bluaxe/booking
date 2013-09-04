class HomeController < ApplicationController
	def index
		@places = Place.all
	end

	def place_detail
		@place = Place.find(params[:id])
		@places = Place.all
		@rooms = @place.rooms.all
		@order_jar = {}
		@rooms.each	do |r|
			@order_jar[r.id]={}
			@orders = r.orders.all
			@orders.each do |o|
				@order_jar[r.id][o.time]=1
			end
		end

	end
	
end
