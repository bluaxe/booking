class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :room
      t.datetime :date
      t.integer :time
      t.integer :type
      t.integer :allowed
      t.text :info
      
      t.timestamps

    end
  end
end
