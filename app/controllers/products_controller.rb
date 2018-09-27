class ProductsController < ApplicationController
  before_action :load_product, :init_resentlies, only: %i(edit show update)
  before_action :load_categories_sort, except: :show
  before_action :category_name_to_id, only: %i(create update)

  def index
    @category_id = params[:category]
    @type_sort = params[:type_sort]
    if @category_id.blank? && @type_sort.blank?
      @products = Product.sort_product_updated.paginate(page: params[:page],
       per_page: Settings.paginate_for.sort_page)
    else
      @products = sort_style @category_id, @type_sort
    end

    render "products/index"
  end

  def show
    @detail_order = current_order.detail_orders.build
    @product_ratings = Rating.product_rating(@product.id)
    @product_on = star_on @product_ratings

    if logged_in?
      @user_rating = Rating.user_rating(@product.id, current_user.id)
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

  def load_product
    @product = Product.find_by(id: params[:id])
    return if @product.present?
    flash[:info] = t ".info"
    redirect_to root_path
  end

  def validation_login
    flash[:warning] = t "Please login !!!"
    redirect_to root_path
  end

  def validation_login
    flash[:warning] = t ".plslogin"
    redirect_to root_path
  end
end
