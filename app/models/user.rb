class User < ActiveRecord::Base
	has_many :places
	has_many :orders
	has_many :rooms, :through => :orders
end
