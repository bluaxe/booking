class HomeController < ApplicationController
	def index
		@places = Place.all
	end

	def place_detail
		@place = Place.find(params[:id])
		@places = Place.all
		@rooms = @place.rooms.all
	end
end
