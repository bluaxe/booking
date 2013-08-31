class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :info
      t.references :place, index: true

      t.timestamps
    end
  end
end
