class Room < ActiveRecord::Base
  belongs_to :place
  has_one :time_table, dependent: :delete
  has_many :orders
  has_many :users, :through => :orders
end
