class StaticPagesController < ApplicationController
  def home
    @hot = Product.all.take(Settings.static_pages.product_quantity)
  end
end
