class SessionsController < ApplicationController
  def new
    if current_user.present?
      flash[:warning] = t("controllers.sessions_controller.warning")
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] ==
        Settings.remember_me.set ? remember(@user) : forget(@user)
      flash[:success] = t("controllers.sessions_controller.back", u: @user.name)
      redirect_back_or @user
    else
      flash[:danger] = t "controllers.users_controller.danger"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
