class MessageController < ApplicationController
  expose :user, find: ->(id, scope) { scope.find(id) }
  expose :message

  def index
  end

  def contact
    result = ContactUser.call(params: msg_params)
    if result.success?
      contact_user
      redirect_to users_path, notice: "Message sent."
    else
      redirect_to user_message_index_path(user), error: "Message didn't send"
    end
  end

  private

  def msg_params
    params.require(:message).permit(:user_id, :name, :email, :text)
  end

  def contact_user
    UserMailer.contact(user.email, msg_params[:name], msg_params[:email], msg_params[:text])
  end
end
