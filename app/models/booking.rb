class Booking < ApplicationRecord
  validates :start_on, presence: true, allow_blank: false
  validates :end_on, presence: true, allow_blank: false
  validates :price, presence: true, allow_nil: false

  belongs_to :user
  belongs_to :venue
end
