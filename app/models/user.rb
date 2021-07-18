class User < ApplicationRecord
  has_secure_password

  has_many :appointments, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
end
