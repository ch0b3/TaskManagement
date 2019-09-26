class Task < ApplicationRecord
  belongs_to :priority
  belongs_to :status_table, :class_name => "Status", foreign_key: "status"

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :deadline, presence: true
  validates :status, presence: true, numericality: { only_integer: true }
  validates :priority_id, presence: true, numericality: { only_integer: true }
  validate :not_before_today

  before_validation :set_default_status

  def search(name, status_id, tasks)
    if name.present? && status_id.present?
      tasks.where(['tasks.name LIKE ?', "%#{name}%"]).where(status: status_id)
    elsif name.blank?
      tasks.where(status: status_id)
    elsif status_id.blank?
      tasks.where(['tasks.name LIKE ?', "%#{name}%"])
    end
  end

  private

  def not_before_today
    errors.add(:deadline, 'が今日よりも前になっています') if deadline < Date.today
  end

  def set_default_status
    self.status = 3 if self.status.blank?
  end
end
