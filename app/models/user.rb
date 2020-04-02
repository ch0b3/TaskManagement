class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :email, presence: true, length: { maximum:30 }, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 8 }
end
