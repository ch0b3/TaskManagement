class Task < ApplicationRecord
  belongs_to :priority
  belongs_to :status_id, :class_name => "Status", foreign_key: "status"
end
