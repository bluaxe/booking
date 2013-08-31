class PlaceController < ApplicationController
	before_action :find_user

	def index
		@places = Place.find_all_by_user_id(session[:uid])
		#@places = Place.all
	end
	def new
		@place = Place.new
	end

	def create
		@place = @user.places.new(place_params)
		if @place.save
			flash[:added]=1
			redirect_to placemanage_url
		else 
			flash[:added]=0
		end
	end

	def destroy 
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to placemanage_url
	end

	def show
		@place = Place.find(params[:id])
		@room = Room.new
		@rooms = @place.rooms.all
		#@rooms = Room.all
	end

private
	def find_user
		@user = User.find(session[:uid])
	end

	def place_params
		params.require(:place).permit(:name,:phone,:info)		
	end

end
