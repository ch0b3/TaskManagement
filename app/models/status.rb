class Status < ApplicationRecord
  has_many :tasks
  validates_associated :tasks

  validates :name, presence: true
end
