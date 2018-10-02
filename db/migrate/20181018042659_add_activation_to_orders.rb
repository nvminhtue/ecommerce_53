class AddActivationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :activated, :boolean, default: false
  end
end
