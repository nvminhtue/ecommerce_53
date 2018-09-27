class Admin::UsersController < ApplicationController
  before_action :load_user, only: :edit

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def home
    
  end

  def edit; end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:info] = t ".no_found"
    redirect_to root_path
  end
end
