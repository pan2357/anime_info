class News < ApplicationRecord
  has_one_attached :image

  validates :headline, presence: true
  validates :content, presence: true

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes, source: :user, class_name: 'User'

  has_many :comments, as: :commentable
  has_many :commented_users, through: :comments, source: :user, class_name: 'User'
end
