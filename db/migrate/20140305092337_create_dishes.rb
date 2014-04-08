class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
