class AddInfoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :info_activated, :boolean, default: false
  end
end
