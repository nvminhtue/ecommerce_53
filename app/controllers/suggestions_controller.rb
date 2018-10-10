class SuggestionsController < ApplicationController
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
      .permit :name, :description, :cartegory_id, :image
  end
end
