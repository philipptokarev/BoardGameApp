class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :reviews

  def admin?
    role == "admin"
  end
end
