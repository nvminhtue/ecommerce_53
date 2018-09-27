class UsersController < ApplicationController
  before_action :load_user, except: %i(index create user_params logged_in new)
  before_action :correct_user, only: %i(edit update show)
  before_action :logged_in_user, only: %i(edit update index destroy)
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      remember @user
      flash[:success] = t ".welcome", u: @user.name
      redirect_to root_path
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      if current_user.customer?
        redirect_to @user
      else
        redirect_to admin_users_path
      end
    else
      if current_user.customer?
        render :edit
      else
        render "admin/users/edit"
      end
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t".delete"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user)
      .permit :name, :email, :phone, :address, :password, :password_confirmation
  end

  def correct_user
    if !(current_user? @user) && current_user.customer?
      redirect_to root_path
      flash[:danger] = t ".permit"
    end
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:info] = t ".info"
    redirect_to login_path
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:info] = t ".no_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
