class Message < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :email, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
