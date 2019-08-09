class Priority < ApplicationRecord
  has_many :tasks
  validates_associated :tasks

  validates :value, presence: true
end
