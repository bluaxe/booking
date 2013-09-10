class PlaceAddPhoto < ActiveRecord::Migration
	def change
		add_column :places, :photo_path, :string
	end
end