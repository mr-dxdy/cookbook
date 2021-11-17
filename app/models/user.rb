class User < ApplicationRecord
  has_many :dishes, foreign_key: :author_id, dependent: :destroy
  has_many :tags, foreign_key: :author_id, dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
