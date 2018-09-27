class CartsController < ApplicationController
  before_action :load_cart
  before_action :sum, only: %i(show destroy)
  include CartsHelper

  def show; end

  def destroy
    ActiveRecord::Base.transaction do
      @order.Pending!
      @order.detail_orders.each do |detail_order|
        detail_order.update_attributes(price:
          detail_order.product.price)
      end
      @order.update_attributes(total: @total)
    end
    flash[:success] = t".success"
    session.delete(:order_id)
    redirect_to root_path
  end

  private
  def load_cart
    @order = current_order
  end

  def sum
    @detail_orders = @order.detail_orders
    sum_cart(@detail_orders)
  end
end
