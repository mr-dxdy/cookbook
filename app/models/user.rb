class User < ApplicationRecord
  has_many :dishes, foreign_key: :author_id, dependent: :destroy
  has_many :tags, ->{ Tag.dishes }, foreign_key: :author_id, dependent: :destroy
  has_many :products, foreign_key: :author_id, dependent: :destroy
  has_many :categories, ->{ Tag.categories }, class_name: 'Tag', foreign_key: :author_id, dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
