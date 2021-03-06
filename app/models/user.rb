class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  has_many :labels
  has_secure_password
end
