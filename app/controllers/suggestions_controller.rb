class SuggestionsController < ApplicationController
  def new
    @sugges = Suggestion.new
  end

  def create
    @sugges = Suggestion.new suggest_param
    return unless @sugges.save
    flash[:success] = t "controllers.suggestion_controller.thank"
    redirect_to root_path
  end

  private
  def suggest_param
    params.require(:suggestion).permit(:name, :description,
      :cartegory_id, :image)
  end
end
