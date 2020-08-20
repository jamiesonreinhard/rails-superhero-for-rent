class Superhero < ApplicationRecord
  belongs_to :user
  has_one_attached :img_url

  has_many :bookings, through: :users

  has_many :reviews

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  validates :name, presence: true
  validates :city, presence: true
  validates :superpower, presence: true
  validates :hourly_price, presence: true

end
