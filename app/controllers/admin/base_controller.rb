class Admin::BaseController < ApplicationController
  before_action :ensure_admin!
  def ensure_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to(root_path, alert: 'You do not have access to this page')
    end
  end
end
