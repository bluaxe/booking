class ChangeTimeTables < ActiveRecord::Migration
	def change
		change_table :time_tables do |t|
			t.rename :Wen_b, :Wed_b
			t.rename :Wen_e, :Wed_e
		end
	end
end