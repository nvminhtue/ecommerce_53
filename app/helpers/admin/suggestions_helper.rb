module Admin::SuggestionsHelper
  def load_suggest_columns
    exclude_columns = ["updated_at", "image"]
    columns = Suggestion.select_col - exclude_columns
    columns
  end

  def status_suggestion
    status = ["Pending", "UnderConsideration", "Implemented", "Deleted"]
  end
end
