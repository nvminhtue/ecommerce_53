class UserMailer < ApplicationMailer
  def order_info user
    @user = user
    mail to: @user.email, subject: t("mailers.user_mailer.order_sub")
  end
end
