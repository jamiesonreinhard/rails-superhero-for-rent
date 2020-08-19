class Superhero < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :superpower, presence: true
  validates :hourly_price, presence: true

end
