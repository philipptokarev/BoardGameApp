class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  expose :users, -> { User.all.page(params[:page]).per(4) }
  expose :user

  def index
  end

  def show
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
end
