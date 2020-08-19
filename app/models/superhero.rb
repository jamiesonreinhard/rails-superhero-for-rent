class Superhero < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :img_url
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :city, presence: true
  validates :superpower, presence: true
  validates :hourly_price, presence: true

end
