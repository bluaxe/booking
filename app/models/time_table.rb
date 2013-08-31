class TimeTable < ActiveRecord::Base
	belongs_to :room

	def init(id)
		self[:room_id]=(id)
		self[:Mon_b]=(1)
		self[:Mon_e]=(28)
		self[:Tue_b]=(1)
		self[:Tue_e]=(28)
		self[:Wen_b]=(1)
		self[:Wen_e]=(28)
		self[:Thu_b]=(1)
		self[:Thu_e]=(28)
		self[:Fri_b]=(1)
		self[:Fri_e]=(28)
		self[:Sat_b]=(1)
		self[:Sat_e]=(28)
		self[:Sun_b]=(1)
		self[:Sun_e]=(28)
	end
end
