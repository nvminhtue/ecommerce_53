class Admin::OrdersController < ApplicationController
  layout "admin_layout"
  before_action :load_order, only: :update

  def index
    @orders = Order.all.paginate(page: params[:page],
     per_page: Settings.paginate_foradmin_page)
  end

  def update
    if @order.update_attributes status: params[:order][:status]
      flash[:success] = t ".updated"
    else
      flash[:success] = t ".update-fail"
    end

    redirect_to admin_orders_path
  end

  private

  def load_order
    @order = Order.find_by id: params[:id]
    return if @order.present?
    flash[:danger] = t ".notfound"
    redirect_to admin_orders_path
  end
end
