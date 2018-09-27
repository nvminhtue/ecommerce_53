class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :quantity
      t.string :category
      t.integer :price
      t.float :rate, default: 0

      t.timestamps
    end
  end
end
