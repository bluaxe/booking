class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :phone
      t.text :info
      t.integer :user_id

      t.timestamps
    end
  end
end
