class CreateDetailOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_orders do |t|
      t.integer :order_id
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
