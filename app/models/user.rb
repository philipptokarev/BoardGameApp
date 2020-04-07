class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :reviews
  has_many :messages, dependent: :destroy
  has_many :games, through: :reviews
  mount_uploader :image, ImageUploader

  def admin?
    role == "admin"
  end
end
