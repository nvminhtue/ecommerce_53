class SessionsController < ApplicationController
  def new
    return if current_user.blank?
    flash[:warning] = t("controllers.sessions_controller.warning")
    redirect_to root_path
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate(params[:session][:password])
      login_success @user
    else
      flash[:danger] = t "controllers.users_controller.danger"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private
  def login_success user
    log_in user
    if params[:session][:remember_me] == Settings.remember_me.set
      remember(user)
    else
      forget(user)
    end
    flash[:success] = t("controllers.sessions_controller.back",
     user_name: user.name)
    redirect_to root_path
  end
end
