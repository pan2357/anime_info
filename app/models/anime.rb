class Anime < ApplicationRecord
  has_one_attached :image
  has_many :platforms
  has_many :sources

  validates :name, presence: true
  validates :synopsis, presence: true
  validates :day_in_week, presence: true
  validates :show_time, presence: true
  validates :on_air, presence: true
  validates :episode, presence: true
end
