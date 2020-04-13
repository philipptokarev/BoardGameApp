class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  expose :users, -> { User.all.page(params[:page]).per(4) }
  expose :user

  def index
  end

  def show
  end

  def contact
    return @message = Message.new(user_id: user.id, name: current_user.full_name, email: current_user.email) if user_signed_in?
    @message = Message.new(user_id: user.id)
  end

  def send_msg
    if Message.create(msg_params)
      contact_user
      redirect_to users_path, notice: "Message sent."
    else
      redirect_to contact_path(@user), error: "Message didn't send"
    end
  end

  def edit
  end

  def update
    if user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :description)
  end

  def msg_params
    params.require(:message).permit(:name, :email, :text, :user_id)
  end

  def correct_user
    redirect_to(root_path, alert: "You do not have access to this page") unless current_user.id == user.id
  end

  def contact_user
    UserMailer.contact(User.find(msg_params[:user_id]).email, msg_params[:name], msg_params[:email], msg_params[:text])
  end
end
