class Task < ApplicationRecord
  belongs_to :priority

  before_create :set_default_status

  private

  def set_default_status
    self.status = 3
  end
end
