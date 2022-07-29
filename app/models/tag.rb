class Tag < ApplicationRecord
  belongs_to :user
  has_many :taggables
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true, numericality: { only_integer: true }
end
