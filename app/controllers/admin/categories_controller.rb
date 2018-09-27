class Admin::CategoriesController < ApplicationController
  layout "admin_layout"
  before_action :load_categories_select, only: %i(edit update new)
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @parent = Category.find_by(id: @category.parent_id)
  end

  def update
    if @category.id.to_s == params[:category][:parent_id]
      flash[:warning] = t ".cannot"
      render :edit
    else
      if @category.update_attributes category_params
        flash[:success] = t ".success"
        redirect_to admin_categories_path
      else
        render :edit
      end
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".destroy-success"
    else
      flash[:warning] = t ".destroy-fail"
    end

    redirect_to admin_categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".created"
    else
      flash[:warning] = t ".created-fail"
    end

    redirect_to admin_categories_path
  end

  private

  def category_params
    if params[:category][:parent_id] == "nil"
      params[:category][:parent_id] = nil
    else
      parent = Category.find_by(id: params[:category][:parent_id])

      if parent.present?
        params[:category][:parent_id] = parent.id
      else
        params[:category][:parent_id] = nil
      end
    end
    params.require(:category)
      .permit :name, :parent_id
  end

  def load_category
    @category = Category.find_by(id: params[:id])
    return if @category.present?
    flash[:info] = t ".info"
    redirect_to admin_root_path
  end

  def load_categories_select
    @categories = categories_option
  end
end
