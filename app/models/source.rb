class Source < ApplicationRecord
  belongs_to :anime
  has_one_attached :image

  validates :name, presence: true
  validates :category, presence: true
  validates :desc, presence: true
end
