class ProductsController < ApplicationController
  before_action :load_product, only: %i(edit show update)
  def index
    @products = Product.paginate(page: params[:page])
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "controllers.products_controller.upload"
      redirect_to @product
    else
      flash[:danger] = t "controllers.users_controller.danger"
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def edit; end

  def show; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "controllers.products_controller.success"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy; end

  def load_product
    @product = Product.find(params[:id])
    return if @product.present?
    flash[:info] = t "controllers.products_controller.info"
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product)
      .permit :name, :description, :rate, :price, :picture, :category, :id
  end
end
