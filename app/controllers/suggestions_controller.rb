class SuggestionsController < ApplicationController
  before_action :load_categories_select, only: %i(new)

  def new
    @suggest = Suggestion.new
  end

  def create
    @suggest = Suggestion.new suggest_param
    if @suggest.save
      flash[:success] = t "controllers.suggestion_controller.thank"
      redirect_to root_path
    else
      flash[:warning] = t "controllers.suggestion_controller.ops"
      redirect_to suggestions_path
    end
  end

  private
  def suggest_param
    params.require(:suggestion)
      .permit :name, :user_id, :description,
       :category_id, :picture, :status, :price
  end

  def load_categories_select
    @categories = Category.all
  end
end
