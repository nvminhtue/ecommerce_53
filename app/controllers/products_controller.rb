class ProductsController < ApplicationController
  before_action :load_product, :init_resentlies, only: %i(edit show update)
  before_action :load_categories_sort, except: :show
  before_action :category_name_to_id, only: %i(create update)

  def index
    @category_sort = params[:category]
    @type_sort = params[:type_sort]
    @detail_order = current_order.detail_orders.build

    if @category_sort.blank? && @type_sort.blank?
      @products = Product.sort_product_updated.paginate(:page => params[:page],
       :per_page => Settings.paginate_for.sort_page)
    else
      @products = sort_style @category_sort, @type_sort
    end

    render "products/index"
  end

  def create
    @product = Product.new product_params_for_update
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

  def edit
    @category = Category.by_id @product.category_id
  end

  def show
    @detail_order = current_order.detail_orders.build
    @product_ratings = Rating.product_rating(@product.id)
    @product_on = star_on @product_ratings

    if logged_in?
      @user_rating = Rating.user_rating(@product.id,current_user.id)
      @user_on = user_star_on @user_rating[0]
    end

    add_resently @product.id
  end

  def rating
    load_product
    update = @product.ratings.find_by(user_id: current_user.id)

    if update.blank?
      Rating.create!(user_id: current_user.id,
       product_id: @product.id, rating: params[:point])
    else
      update.update_attributes(rating: params[:point])
    end

    show
  end

  def update
    if @product.update_attributes product_params_for_update
      flash[:success] = t ".success"
      redirect_to @product
    else
      render :edit
    end
  end

  def category_name_to_id
    name_to_id = Category.by_name params[:product][:category]

    if name_to_id.blank?
      flash[:warning] = "Category not found"
      redirect_to root_path
    else
      params[:product][:category_id] = name_to_id[0].id
    end
  end

  def destroy; end

  private
  def product_params
    params.require(:product)
      .permit :name, :description, :rate, :price, :picture, :category, :id
  end

  def product_params_for_update
    params.require(:product)
      .permit :name, :description, :rate, :price, :picture, :category_id, :id
  end

  def load_product
    @product = Product.find(params[:id])
    return if @product.present?
    flash[:info] = t ".info"
    redirect_to root_path
  end

  def validation_login
    flash[:warning] = t "Please login !!!"
    redirect_to root_path
  end
end
