class Product < ApplicationRecord
  has_many :order_details
  has_many :ratings
  has_many :users, through: :ratings
  validates :name, presence: true, uniqueness: true
  scope :hot_trend, -> do
    joins(:order_details)
    .group("order_details.product_id")
    .order("count(order_details.product_id) DESC")
    .limit(12)
  end
end
