class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Pundit

  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  responders :flash
  respond_to :html

  private

  def record_not_found
    redirect_to root_path, alert: "Coundn't find it"
  end
end
