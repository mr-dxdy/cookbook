class Dish < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :tag_links, as: :target
  has_many :tags, through: :tag_links

  validates :name, uniqueness: { scope: :author_id }, presence: true
  validates :servings_number, :cooking_time, numericality: { greater_than: 0 }
end
