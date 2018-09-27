class AddUserIdToDetailOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :detail_orders, :order_id, :integer
  end
end
