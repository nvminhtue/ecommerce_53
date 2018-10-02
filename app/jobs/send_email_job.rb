class SendEmailJob < ApplicationJob
  queue_as :default
   def perform order
    @order = order
    @user = User.find_by(id: @order.user_id)
    UserMailer.info_order(@user).deliver_later
  end
end
