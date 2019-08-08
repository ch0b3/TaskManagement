class Priority < ApplicationRecord
  has_many :tasks

  validates :value, presence: true
end
