class Task < ApplicationRecord
  belongs_to :priority

  belongs_to :status_id, :class_name => "Status", foreign_key: "status"



  before_validation :set_default_status

  private

  def set_default_status
    self.status = 3 if self.status.blank?
  end
end
