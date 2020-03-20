class UsersController < ApplicationController
  before_action :find_user, only: %i[show contact edit update destroy correct_user]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def show; end

  def contact; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :description)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to(root_path, alert: 'You do not have access to this page') unless current_user.id == @user.id
  end
end
