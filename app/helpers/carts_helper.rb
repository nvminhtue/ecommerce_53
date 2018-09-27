module CartsHelper
  def sum_cart detail
    @total = 0
    detail.each do |detail_order|
      @total += detail_order.product.price*detail_order.quantity
    end
  end
end
