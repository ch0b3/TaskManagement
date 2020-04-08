class Label < ApplicationRecord
  has_many :tasks, through: :label_tasks
end
