class Admin::OrdersController < ApplicationController
  # include OrdersHelper
  layout "admin_layout"
  before_action :load_order, only: [:update, :destroy]

  def index
    if params[:status] == "Pending"
      @title_head = "NEW ORDERS"
      @orders = Order.new_order.paginate(page: params[:page],
        per_page: Settings.paginate_foradmin_page)
    else
      @title_head = "MANAGER ORDERS"
      @orders = Order.all.paginate(page: params[:page],
        per_page: Settings.paginate_foradmin_page)
    end
  end

  def update
    if @order.update_attributes status: params[:order][:status]
      flash[:success] = t ".updated"
    else
      flash[:success] = t ".update-fail"
    end

    redirect_to admin_orders_path
  end

  def destroy
    @order.delete
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
