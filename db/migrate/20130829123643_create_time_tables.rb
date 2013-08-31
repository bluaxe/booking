class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
	  t.integer :room_id
	  t.integer :Mon_b
	  t.integer :Mon_e
	  t.integer :Tue_b
	  t.integer :Tue_e
	  t.integer :Wen_b
	  t.integer :Wen_e
	  t.integer :Thu_b
	  t.integer :Thu_e
	  t.integer :Fri_b
	  t.integer :Fri_e
	  t.integer :Sat_b
	  t.integer :Sat_e
	  t.integer :Sun_b
	  t.integer :Sun_e

      t.timestamps
    end
  end
end
