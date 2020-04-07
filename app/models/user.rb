class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum:40 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
