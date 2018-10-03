class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image, :default => "product/default-product.jpg"
      t.integer :quantity
      t.integer :cartegory_id
      t.decimal :price

      t.timestamps
    end
  end
end
