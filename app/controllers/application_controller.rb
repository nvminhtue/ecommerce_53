class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :load_menu_categories

  private

  def load_menu_categories
    @array_categories = Category.parent_category.to_a
  end
end
