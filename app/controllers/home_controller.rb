class HomeController < ApplicationController
	def index
		@places = Place.all
	end

	def place_detail
		@place = Place.find(params[:id])
		@rooms = @place.rooms.all
	end
end
