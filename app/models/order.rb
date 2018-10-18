class Order < ApplicationRecord
  has_many :detail_orders
  belongs_to :user, optional: true
  scope :_order, ->user_id{where user_id: user_id}
  scope :select_col, ->{attribute_names}
  scope :pending_count, -> {where(status: "Pending").size}
  scope :new_order, -> {where(status: "Pending")}

  enum status: {Idle: 0, Pending: 1, Delivering: 2, Paid: 3}

  def self.total_grouped_by_month

    arr = []
    # start = 1.year.ago.to_date.beginning_of_month
    start = (Date.today+1.month).beginning_of_year
    today = Date.today.beginning_of_month
    year = Date.today.strftime("%Y").to_i
    range = (start..today).select {|d| d.day ==1}
      range.map do |month|
        arr << month.strftime("%m").to_i
      end
    orders = where("cast(strftime('%m', created_at) as int) IN (?) and cast(strftime('%Y', created_at) as int) = #{year}", arr)
    orders = orders.group("cast(strftime('%m', created_at) as int)")
    orders = orders.select("created_at, sum(total) as total_price")
    orders.each do |order|
      order.update_attributes(created_at: order.created_at.to_date.beginning_of_month)
    end
    orders.group_by {|o| o.created_at.to_date}
    orders.map do |order|
      {
        date: order.created_at.strftime("%Y-%m"),
        total: order.try(:total_price)
      }
    end
  end
end
