class Task < ApplicationRecord
  belongs_to :priority
  belongs_to :status_id, :class_name => "Status", foreign_key: "status"

  before_create :set_default_status

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :deadline, presence: true
  validates :status, presence: true, numericality: { only_integer: true }
  # validates :user_id, presence: true
  validates :priority_id, presence: true, numericality: { only_integer: true }
  validate :not_before_today

  private

  def not_before_today
    errors.add(:deadline, 'が正しくありません') if deadline < Date.today
  end

  def set_default_status
    self.status = 3
  end

end
