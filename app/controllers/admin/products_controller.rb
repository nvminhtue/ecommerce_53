class Admin::ProductsController < ApplicationController
  layout "admin_layout"
  before_action :load_product, only: %i(edit update destroy)
  before_action :load_categories_select, only: %i(edit new create)

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @category = Category.find_by(id: @product.category_id)
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".success"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t ".destroy-success"
    else
      flash[:success] = t ".destroy-fail"
    end

    redirect_to admin_products_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".created"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product)
      .permit :name, :description, :category_id, :price, :picture
  end

  def load_product
    @product = Product.find_by(id: params[:id])
    return if @product.present?
    flash[:info] = t ".info"
    redirect_to root_path
  end

  def load_categories_select
    @categories = categories_option
  end
end
