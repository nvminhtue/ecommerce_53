class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :detail_order, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: "Idle"
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
