class Superhero < ApplicationRecord
  belongs_to :user, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :superpower, presence: true
  validates :hourly_price, presence: true

end
