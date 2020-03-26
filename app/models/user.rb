class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :reviews
  has_many :messages, dependent: :destroy

  def admin?
    role == "admin"
  end
end
