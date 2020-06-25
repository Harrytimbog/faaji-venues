class Venue < ApplicationRecord
  validates :description, length: { minimum: 5 }
  validates :price, presence: true, allow_nil: false

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
end
