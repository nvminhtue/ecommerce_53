class Product < ApplicationRecord
  VALID_MONEY_REGEX = /d*(\.d{1,2})?/
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :category

  scope :hot_trend, -> do
    joins(:order_details)
    .group("order_details.product_id")
    .order("count(order_details.product_id) DESC")
    .limit(12)
  end
  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.product.name._max}
  validates :description, presence: true,
    length: {maximum: Settings.product.description._max}
  validates :category, presence: true
  validates :price, presence: true, format: {with: VALID_MONEY_REGEX}
  validates :rate, presence: true
end
