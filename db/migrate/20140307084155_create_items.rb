class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :dish, index: true
      t.integer :quantity
      t.references :cart, index: true

      t.timestamps
    end
  end
end
