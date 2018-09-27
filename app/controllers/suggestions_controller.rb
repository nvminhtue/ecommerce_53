class SuggestionsController < ApplicationController
  before_action :check_user_logged
  before_action :load_categories_sort
  before_action :category_name_to_id, only: :create

  def new
    @suggest = Suggestion.new
  end

  def create
    category_name_to_id
    @suggest = Suggestion.new suggest_param
    return unless @suggest.save
    flash[:success] = t "controllers.suggestion_controller.thank"
    redirect_to root_path
  end

  private

  def suggest_param
    params.require(:suggestion)
      .permit :user_id, :name, :description, :cartegory_id, :picture, :price
  end

  def check_user_logged
    unless logged_in?
      flash[:info] = t ".pls_login"
      redirect_to root_path
    end
  end

  def category_name_to_id
    name_to_id = Category.by_name params[:suggestion][:cartegory_id]

    if name_to_id.blank?
      flash[:warning] = "Category not found"
      redirect_to root_path
    else
      params[:suggestion][:category_id] = name_to_id[0].id
    end
  end
end
