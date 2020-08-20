class Booking < ApplicationRecord  
  belongs_to :user
  belongs_to :superhero

  validates :date, presence: true
  validates :number_of_hours, presence: true
  validates :location, presence: true
  validates :event, presence: true
end
