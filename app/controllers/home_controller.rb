class HomeController < ApplicationController
	def index
		@places = Place.all
	end

	def place_detail
		@place = Place.find(params[:id])
		@places = Place.all
		@rooms = @place.rooms.all

		if request.get? 
			@time = Time.new.strftime('%Y-%m-%d').to_s
		else
			@time = params[:date]
		end

		@order_jar = {}
		@rooms.each	do |r|
			@order_jar[r.id]={}
			@orders = r.orders.find_all_by_date(@time)
			@orders.each do |o|
				@order_jar[r.id][o.time]=1
			end
		end

	end
	
end
