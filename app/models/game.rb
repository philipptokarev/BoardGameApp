class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates_presence_of :image

  mount_uploader :image, ImageUploader

  scope :published, ->{ where(status: :published) }

  def average_rating
    return nil if reviews.count.zero?
    reviews.average(:rating).round(2)
  end
end
