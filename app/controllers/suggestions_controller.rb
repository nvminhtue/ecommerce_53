class SuggestionsController < ApplicationController
  before_action :load_categories_select, only: %i(new)
  before_action :check_user_logged


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
      .permit :name, :user_id, :description,
       :category_id, :picture, :status, :price
  end

  def load_categories_select
    @categories = Category.all

  def check_user_logged
    unless logged_in?
      flash[:info] = t ".pls_login"
      redirect_to root_path
    end
  end
end
