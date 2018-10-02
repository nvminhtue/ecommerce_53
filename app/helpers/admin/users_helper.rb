module Admin::UsersHelper
  def load_user_columns
    exclude_columns = ["password", "password_digest", "remember_digest", "updated_at"]
    columns = User.select_col - exclude_columns
    columns
  end
end
