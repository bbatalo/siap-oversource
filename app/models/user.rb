class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true
  has_secure_password
end
