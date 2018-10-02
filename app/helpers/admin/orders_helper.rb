module Admin::OrdersHelper
  def load_order_columns
    columns = ["id", "user_id", "total", "created_at", "status"]
    columns
  end

  def status_order
    status = ["Idle", "Pending", "Delivering", "Paid"]
  end

  def orders_chart_data
    orders_by_month = Order.total_grouped_by_month(1.year.ago)
    # (3.months.ago.to_date..Date.today).map do |date|
    range = (1.year.ago.to_date..Date.today).select {|d| d.day ==1}
    range.map do |date|
      {
        created_at: date.strftime("%Y-%m"),
        total: orders_by_month[date].try(:first).try(:total_price) || 0
      }
    end
  end
end
