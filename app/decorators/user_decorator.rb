class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role, :reviews

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def admin?
    role == 'admin'
  end
end
