class Anime < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :synopsis, presence: true
  validates :day_in_week, presence: true
  validates :show_time, presence: true
  validates :on_air, presence: true
  validates :episode, presence: true

  has_many :platforms
  has_many :sources

  has_many :follows
  has_many :followed_users, through: :follows, source: :user, class_name: 'User'

  has_many :mylists
  has_many :saved_users, through: :mylists, source: :user, class_name: 'User'

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes, source: :user, class_name: 'User'

  has_many :comments, as: :commentable
  has_many :commented_users, through: :comments, source: :user, class_name: 'User'

end
