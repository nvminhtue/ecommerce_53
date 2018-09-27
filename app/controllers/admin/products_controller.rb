class Admin::ProductsController < ApplicationController
  before_action :load_product, only: :destroy

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    if @product.destroy
      flash[:success] = t "Deleted"
      redirect_to admin_products_path
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product.present?
    flash[:info] = t "Product not found !!"
    redirect_to root_path
  end
end
