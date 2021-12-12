class News < ApplicationRecord
  has_one_attached :image

  validates :headline, presence: true
  validates :content, presence: true

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes, source: :user, class_name: 'User'

  has_many :comments, as: :commentable
  has_many :commented_users, through: :comments, source: :user, class_name: 'User'

  def this_user_liked(user_id)
    return self.liked_users.include?(User.find_by(id: user_id))
  end

  def get_liked_user_names
    return self.liked_users.order('name').pluck('name').join(' ')
  end
end
