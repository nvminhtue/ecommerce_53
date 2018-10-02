module Admin::ProductsHelper
  def load_product_columns
    exclude_columns = ["category_id", "picture", "image", "rate", "image", "created_at", "password_digest", "remember_digest", "updated_at"]
    columns = Product.select_col - exclude_columns
    columns
  end
end
