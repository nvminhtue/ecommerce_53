class OrdersController < ApplicationController
  def index
    if current_user.customer?
      @history_orders = Order._order(current_user.id).includes(:detail_orders)
    else
      @history_orders = Order.includes(:detail_orders)
    end
  end

  def show
    @history = Order.includes(:detail_orders).find(params[:id])
    if @history.user_id != current_user.id&& current_user.customer?
      flash[:warning] = t".permit"
      redirect_to root_path
    end
  end

  def update
    @history = Order.find(params[:id])
    @history.update_attributes(order_params)
    redirect_to history_path
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
