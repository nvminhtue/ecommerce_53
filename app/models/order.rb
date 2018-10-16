class Order < ApplicationRecord
  has_many :detail_orders
  belongs_to :user, optional: true
  scope :_order, ->user_id{where user_id: user_id}
  scope :select_col, ->{attribute_names}

  enum status: {Idle: 0, Pending: 1, Delivering: 2, Paid: 3}
end
