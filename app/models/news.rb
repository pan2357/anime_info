class News < ApplicationRecord
  has_one_attached :image

  validates :headline, presence: true
  validates :content, presence: true
end
