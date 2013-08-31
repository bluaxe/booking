class Room < ActiveRecord::Base
  belongs_to :place
  has_one :time_table, dependent: :delete
end
