class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :id_number
      t.string :name

      t.timestamps
    end
  end
end
