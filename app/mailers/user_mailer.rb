class UserMailer < ApplicationMailer
  def info_order order
    @user = User.find_by(id: order.user_id)
    @order = order
    mail to: @user.email, subject: "Delivering Products"
  end
end
