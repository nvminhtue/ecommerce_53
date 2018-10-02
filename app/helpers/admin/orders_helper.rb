module Admin::OrdersHelper
  def load_order_columns
    columns = ["id", "user_id", "total", "created_at", "status"]
    columns
  end

  def status_order
    status = ["Idle", "Pending", "Delivering", "Paid"]
  end
end
