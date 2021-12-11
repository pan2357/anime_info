class Platform < ApplicationRecord
  belongs_to :anime

  validates :name, presence: true
  validates :link, presence: true
end
