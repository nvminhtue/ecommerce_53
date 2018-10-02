class SuggestionsController < ApplicationController
  before_action :load_categories_select, only: %i(new)

  def new
    @suggest = Suggestion.new
  end

  def create
    @suggest = Suggestion.new suggest_param
    return unless @suggest.save
    flash[:success] = t "controllers.suggestion_controller.thank"
    redirect_to root_path
  end

  private
  def suggest_param
    params.require(:suggestion)
      .permit :name, :user_id, :description, :category_id, :picture, :status
  end

  def load_categories_select
    @categories = Category.all
  end
end
