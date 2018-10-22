class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :category_id
      t.integer :price
      t.float :rate, default: 0
      t.integer :price

      t.timestamps
    end
  end
end
