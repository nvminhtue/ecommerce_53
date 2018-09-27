class DetailOrder < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validate :product_present

  private

  def product_present
    error.add(I18n.t("model.detail_order.invalid",
      product: product)) if product.blank?
  end
end
