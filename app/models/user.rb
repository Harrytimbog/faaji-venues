class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, allow_blank: false, uniqueness: true
  validates :encrypted_password, presence: true, allow_blank: false

  has_many :bookings
  has_many :venues, through: :bookings

  has_many :owned_venues, foreign_key: 'owner_id', class_name: 'Venue'
end
