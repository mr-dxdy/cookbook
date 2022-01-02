class Ingredient < ApplicationRecord
  enum unit: %i[gram milliliter piece]

  belongs_to :product
  belongs_to :dish

  validates :number, numericality: { greater_than: 0 }
  validates :unit, presence: true

  def unit_record
    Unit[unit_for_database]
  end
end
