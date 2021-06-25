class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :massage

  validates :customer_name, presence: true
  validates :massage_type, presence: true
  validates :date, presence: true
  validates :city, presence: true
end
