class Review < ApplicationRecord
  belongs_to :superhero

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: 0..5
  validates :description, presence: true
end
