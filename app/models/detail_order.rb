class DetailOrder < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  scope :of_order, -> order_id do
    joins(:product).includes(:product).
    joins(:order).includes(:order).
    where(order_id: order_id)
  end

  private

  def product_present
    error.add(:product, "is not valid") if product.blank?
  end
end
