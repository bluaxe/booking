class ChangeUserVerifiedType< ActiveRecord::Migration
	def change
		change_table :users do |t|
			t.change :verified, :string
		end
	end
end