class Admin::UsersController < ApplicationController
  layout "admin_layout"
  before_action :load_user, only: %i(edit update destroy)

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete"
    else
       flash[:success] = t ".delete_fail"
    end

    redirect_to admin_users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".created"
      redirect_to admin_users_path
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit :name, :email, :phone, :address, :role,
       :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:info] = t ".no_found"
    redirect_to root_path
  end
end
