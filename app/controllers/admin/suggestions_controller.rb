class Admin::SuggestionsController < ApplicationController
  layout "admin_layout"
  before_action :load_suggestion, only: :update

  def index
    if params[:status] == "Pending"
      @suggestion = Suggestion.new_suggestion.paginate(page: params[:page],
        per_page: Settings.paginate_for.admin_page)
    else
      @suggestion =  Suggestion.of_manager.paginate(page: params[:page],
        per_page: Settings.paginate_for.admin_page)
    end
  end

  def new
    @suggest = Suggestion.new
  end

  def update
    if @suggestion.update_attributes status_params
      flash[:success] = t ".updated"
    else
      flash[:danger] = t ".update-fail"
    end

    redirect_to admin_suggestions_path
  end

  private 

  def load_suggestion
    @suggestion = Suggestion.find_by(id: params[:id])
    return if @suggestion.present?
    flash[:danger] = t ".sug-notfound"
  end

  def status_params
    params.require(:suggestion).permit :status
  end
end
