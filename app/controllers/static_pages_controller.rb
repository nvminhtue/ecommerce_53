class StaticPagesController < ApplicationController
  def home
    @hot = Product.hot_trend
    @product_home = Product.take(12)
  end
end
