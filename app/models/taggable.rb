class Taggable < ApplicationRecord
  belongs_to :task
  belongs_to :tag
  validates :task_id, presence: true, numericality: { only_integer: true }
  validates :tag_id, presence: true, numericality: { only_integer: true }
end
