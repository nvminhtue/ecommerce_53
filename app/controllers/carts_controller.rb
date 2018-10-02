class CartsController < ApplicationController
  before_action :load_cart
  def show
    @detail_orders = @order.detail_orders
    @order.update_attributes(total: 0)
    @detail_orders.each do |detail_order|
      @order.update_attributes(total: current_order.total +
        detail_order.product.price*detail_order.quantity)
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
    @order.update_attributes(activated: true)
    UserMailer.info_order(@order).deliver_now
    flash[:info] = t".info"
    SendEmailJob.set(wait: 20.seconds).perform_later(@order)
    session.delete(:order_id)
    redirect_to root_path
  end

  private
  def load_cart
    @order = current_order
  end
end
