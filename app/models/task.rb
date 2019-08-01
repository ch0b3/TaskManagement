class Task < ApplicationRecord
  belongs_to :priority, :class_name => 'Priority', :foreign_key => 'priority'
end
