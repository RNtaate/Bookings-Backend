class Massage < ApplicationRecord
  has_one_attached :massage_image

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  validate :acceptable_image

  def acceptable_image
    return unless massage_image.attached?

    errors.add(:massage_image, 'is too big, Image must have maximum of 1mb') if massage_image.byte_size > 1.megabyte
  end

  scope :ascending_order, -> { order('name ASC') }
end
