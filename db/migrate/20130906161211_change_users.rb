class ChangeUsers < ActiveRecord::Migration
	def change
		add_column :users, :admin, :integer
		add_column :users, :verified, :integer
	end
end