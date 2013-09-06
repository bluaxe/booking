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
			for i in 1..28 do
				@order_jar[r.id][i]='blank'
			end

			#Find Time Table for the room & render color for the view	
			@week = Time.parse(@time).strftime('%a').to_s
			@st = r.time_table[@week+'_b']
			@et = r.time_table[@week+'_e']
			for i in @st.to_i..@et.to_i do
				@order_jar[r.id][i]='available'
			end

			#mark which time has a order there
			@orders = r.orders.find_all_by_date(@time)
			@orders.each do |o|
				for i in o.start_time..o.end_time do
					@order_jar[r.id][i]='ordered'
				end
			end
		end

	end
	
end
