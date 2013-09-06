class ChangeOrders < ActiveRecord::Migration
	def change
		change_table :orders do |t|
			t.change :date, :string
		end
	end
end