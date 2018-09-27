class CartsController < ApplicationController
  before_action :load_cart

  def show
    @detail_orders = @order.detail_orders
    @order.update_attributes(total: 0)
    ActiveRecord::Base.transaction do
      @detail_orders.each do |detail_order|
        @order.update_attributes(total: current_order.total +
          detail_order.product.price*detail_order.quantity)
      end
    end
  end

  def destroy
    @order.update_attributes(status: "Pending")
    ActiveRecord::Base.transaction do
      @order.detail_orders.each do |detail_order|
        detail_order.update_attributes(price:
          detail_order.product.price)
      end
    end
    flash[:success] = t".success"
    session.delete(:order_id)
    redirect_to root_path
  end

  private
  def load_cart
    @order = current_order
  end
end
