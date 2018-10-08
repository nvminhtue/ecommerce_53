class ProductsController < ApplicationController
  before_action :load_product, only: :show
  include ProductLib

  def show
    @product_ratings = Rating.product_rating(@product.id)
    @product_on = star_on @product_ratings

    # current_user.id !!!
    @user_rating = Rating.user_rating(@product.id,1)
    @user_on = user_star_on @user_rating[0]
  end

  def rating
    load_product
    update = @product.ratings.find_by(user_id: 1)

    if update.blank?
      # current_user.id !!!
      Rating.create!(user_id: 1,
       product_id: @product.id, rating: params[:point])
    else
      update.update_attributes(rating: params[:point])
    end

    show
  end

  private

  def load_product
    @product = Product.find_by(id: params[:id])

    return unless @product.blank?
    flash[:danger] = t "controllers.products_controller.warning"
    redirect_to root_path
  end
end
