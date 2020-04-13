class User < ApplicationRecord
  has_secure_password

  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 40 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  before_destroy :check_admin_user_exist

  private

  def check_admin_user_exist
    return unless admin?

    throw :abort if User.where(admin: true).size == 1
  end
end
