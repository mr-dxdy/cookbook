class Dish < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :servings_number, :cooking_time, numericality: { greater_than: 0 }
end
