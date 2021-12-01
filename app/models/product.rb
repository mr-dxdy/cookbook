class Product < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :category_links, class_name: 'TagLink', as: :target
  has_many :categories, through: :category_links, class_name: 'Tag', source: :tag

  validates :name, presence: true
end
