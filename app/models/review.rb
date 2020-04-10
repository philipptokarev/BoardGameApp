class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game, counter_cache: true

  validates :review, presence: true
  validates :rating, presence: true
end
