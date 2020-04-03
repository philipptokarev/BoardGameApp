class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  scope :published, ->{ where(status: :published) }

  def average_rating
    return nil if reviews.count.zero?
    reviews.average(:rating).round(2)
  end
end
