class Task < ApplicationRecord
  belongs_to :user
  has_many :taggables
  validates :status, presence: true
  STATUSES = [:to_do, :done]
end
