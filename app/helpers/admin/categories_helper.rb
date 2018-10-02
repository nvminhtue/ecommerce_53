module Admin::CategoriesHelper
  def load_category_columns
    exclude_columns = ["created_at", "updated_at"]
    columns = Category.select_col - exclude_columns
    columns
  end
end
