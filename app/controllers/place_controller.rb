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
		if @place.photo_path == nil 
			@place.photo_path = "common.png"
		end
		@places = Place.find_all_by_user_id(session[:uid])
		@room = Room.new
		@rooms = @place.rooms.all
		#@rooms = Room.all
	end

	def photo
		@places = Place.find_all_by_user_id(session[:uid])
		@place = Place.find(params[:id])
	end

	def upload
		@place = Place.find(params[:id])
		file_io = params[:photo]
		file_type = file_io.original_filename.split('.').pop
		file_name = Time.now.strftime("%Y%m%d%H%M%S").to_s+@place.id.to_s+'.'+file_type
		#TODO file type check
		File.open(Rails.root.join('public','uploads', file_name),'wb') do |f|
			f.write(file_io.read)
		end
		@place.photo_path = file_name
		@place.save
		redirect_to '/place/'+@place.id.to_s
	end

private
	def find_user
		@user = User.find(session[:uid])
	end

	def place_params
		params.require(:place).permit(:name,:phone,:info)		
	end

end
