class ProductsController < ApplicationController
  include ApplicationHelper
  include ProductLib
  before_action :load_product, only: %i(edit show update)
  before_action :load_categories_sort, except: :show

  def index
    @products = Product.paginate(page: params[:page])
    @detail_order = current_order.detail_orders.build
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".upload"
      redirect_to @product
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def edit; end

  def show
    @product_ratings = Rating.product_rating(@product.id)
    @product_on = star_on @product_ratings
    @user_rating = Rating.user_rating(@product.id,1)
    @user_on = user_star_on @user_rating[0]
  end

  def rating
    load_product
    update = @product.ratings.find_by(user_id: 1)
    if update.blank?
      Rating.create!(user_id: 1,
      product_id: @product.id, rating: params[:point])
    else
      update.update_attributes(rating: params[:point])
    end

    show
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".success"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy; end

  private
  def product_params
    params.require(:product)
      .permit :name, :description, :rate, :price, :picture, :category, :id
  end

  def load_product
    @product = Product.find(params[:id])
    return if @product.present?
    flash[:info] = t ".info"
    redirect_to root_path
  end
end
