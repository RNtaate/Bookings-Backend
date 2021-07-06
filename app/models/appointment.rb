class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :massage

  validates :customer_name, presence: true
  validates :massage_type, presence: true
  validates :date, presence: true
  validates :city, presence: true

  scope :where_user_is, -> (current_user) {where(user_id: current_user.id)}
  scope :ascending_date, -> {order('date ASC')}

  def self.my_appointments(some_user)
    Appointment.where_user_is(some_user).includes(:massage)
  end
end
