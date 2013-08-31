class Place < ActiveRecord::Base
	belongs_to :user
	has_many :rooms, dependent: :delete_all
end

