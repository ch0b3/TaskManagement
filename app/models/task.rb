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

  # def self.search(name, status)
  #   if name.present? && status.present?
  #     Task.joins(:priority, :status_table).includes(:priority, :status_table).where(['tasks.name LIKE ?', "%#{name}%"]).where(status: status)
  #   elsif name.blank?
  #     Task.joins(:priority, :status_table).includes(:priority, :status_table).where(status: status)
  #   elsif status.blank?
  #     Task.joins(:priority, :status_table).includes(:priority, :status_table).where(['tasks.name LIKE ?', "%#{name}%"])
  #   end
  # end
  scope :joins_includes, -> { joins(:priority, :status_table).includes(:priority, :status_table) }
  scope :search_name, ->(name) { where(['tasks.name LIKE ?', "%#{name}%"]) }
  scope :search_status, ->(status) { where(status: status) }

  private

  def not_before_today
    errors.add(:deadline, 'が今日よりも前になっています') if deadline < Date.today
  end

  def set_default_status
    self.status = 3 if self.status.blank?
  end
end
