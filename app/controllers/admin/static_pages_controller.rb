class Admin::StaticPagesController < ApplicationController
  layout "admin_layout"

  def home
    @order_count = Order.pending_count
    @suggetion_count = Suggestion.pending_count
  end
end
