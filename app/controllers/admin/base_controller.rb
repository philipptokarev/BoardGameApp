class Admin::BaseController < ApplicationController
  before_action :ensure_admin!

  private

  def ensure_admin!
    redirect_to(root_path, alert: "You do not have access to this page") unless user_signed_in? && current_user.admin?
  end
end
