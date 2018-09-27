class DetailOrdersController < ApplicationController
  before_action :load_order
  def create
    k = @order.detail_orders.ids
    @order_detail = @order.detail_orders.build(order_item_params)
    k.each do |i|
      if @order.detail_orders.find_by(id:i).product_id ==
        @order.detail_orders.last.product_id
        @order.detail_orders.find_by(id:i).
          update_attributes(quantity:
            @order.detail_orders.find_by(id:i).quantity+
            @order.detail_orders.last.quantity)
        @order.detail_orders.last.delete
      end
    end
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def update
    @detail_order = @order.detail_orders.find(params[:id])
    @detail_order.update_attributes(order_item_params)
    @detail_orders = @order.detail_orders
    redirect_to cart_path
  end

  def destroy
    @detail_order = @order.detail_orders.find(params[:id])
    @detail_order.destroy
    @detail_orders = @order.detail_orders
    redirect_to cart_path
  end

  private
  def order_item_params
    params.require(:detail_order).permit(:quantity, :product_id)
  end

  def load_order
    @order = current_order
  end
end
