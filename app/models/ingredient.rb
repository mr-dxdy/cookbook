class Ingredient < ApplicationRecord
  enum unit: %i[gram milliliter]

  belongs_to :product
  belongs_to :dish

  validates :number, numericality: { greater_than: 0 }
  validates :unit, presence: true
end
