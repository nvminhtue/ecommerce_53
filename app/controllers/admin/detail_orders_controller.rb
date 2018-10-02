class Admin::DetailOrdersController < ApplicationController
  layout "admin_layout"

  def show
    @details_order = DetailOrder.of_order(params[:id])
  end
end
