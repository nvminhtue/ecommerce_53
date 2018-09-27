class UsersController < ApplicationController
  before_action :load_user, except: %i(index create user_params logged_in new)
  before_action :correct_user, only: %i(edit update show)
  before_action :logged_in_user, only: %i(edit update)

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      remember @user
      flash[:success] = t "controllers.users_controller.welcome", u: @user.name
      redirect_to @user
    else
      flash[:danger] = t "controllers.users_controller.danger"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controllers.users_controller.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email, :phone, :address,:password, :password_confirmation)
  end

  def correct_user
    return if current_user? @user
    redirect_to root_path
    flash[:danger] = t "controllers.users_controller.permit"
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:info] = t "controllers.users_controller.info"
    redirect_to login_path
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:info] = t "controllers.users_controller.no_found"
    redirect_to root_path
  end
end
