class Task < ApplicationRecord
  belongs_to :user
  has_many :taggables
  STATUSES = %i[to_do done]
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :level, numericality: { in: 1..5 }, allow_blank: true
  validates :deadline, format: { with: /[a-zA-Z]/ }
  validates :status, inclusion: { in: %w(to_do done),
    message: "%{value} is not a valid status" }, allow_blank: true
  
end
