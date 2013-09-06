class AddEndTime < ActiveRecord::Migration
	def change
		change_table :orders do |t|
			t.rename :time, :start_time
		end
		add_column :orders, :end_time, :integer
	end
end