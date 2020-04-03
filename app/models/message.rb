class Message < ApplicationRecord
  validates :email, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
