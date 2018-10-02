class StaticPagesController < ApplicationController
  before_action :load_categories_sort, :load_recently, only: :home
  
  def home
    @hot = Product.hot_trend
    @products_updated = Product.sort_product_updated
  end
end
