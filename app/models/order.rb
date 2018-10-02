class Order < ApplicationRecord
  has_many :detail_orders
  belongs_to :user, optional: true
  scope :_order, ->user_id{where user_id: user_id}
  scope :select_col, ->{attribute_names}
  scope :pending_count, -> {where(status: "Pending").size}

  enum status: {Idle: 0, Pending: 1, Delivering: 2, Paid: 3}

  def self.total_grouped_by_month(start)
    arr = []
    start = start.to_date.beginning_of_month
    today = Date.today.beginning_of_month
    range = (start..today).select {|d| d.day ==1}
      range.map do |month|
        arr << month.strftime("%m").to_i
      end
    orders = where("cast(strftime('%m', created_at) as int) IN (?)", arr)
    orders = orders.group("cast(strftime('%m', created_at) as int)")
    orders = orders.select("created_at, sum(total) as total_price")
    orders.each do |order|
      order.update_attributes(
        created_at: order.created_at.to_date.beginning_of_month)
    end
    orders.group_by {|o| o.created_at.to_date}
  end
end
