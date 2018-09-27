class Admin::CategoriesController < ApplicationController
  before_action :load_categories_sort, except: :show
  before_action :category_name_to_id, only: %i(create update)
  before_action :load_category, except: :index

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to admin_categories_path
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "Deleted"
      redirect_to admin_categories_path
    end
  end

  private

  def load_category
    @category = Category.find(params[:id])
    return if @category.present?
    flash[:info] = t "Category not found"
    redirect_to root_path
  end

  def category_params
    params.require(:category)
      .permit :name, :parent_id
  end

  def category_name_to_id
    name_to_id = Category.by_name params[:category][:parent_id]

    if name_to_id.blank?
      flash[:warning] = "Category not found"
      redirect_to root_path
    else
      params[:category][:parent_id] = name_to_id[0].id
    end
  end
end
