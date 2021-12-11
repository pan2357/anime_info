class User < ApplicationRecord
    has_secure_password

    has_many :follows
    has_many :followed_animes, through: :follows, source: :anime, class_name: 'Anime'

    has_many :mylists
    has_many :saved_animes, through: :mylists, source: :anime, class_name: 'Anime'


    validates :name, uniqueness: { case_sensitive: false }, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true, length: { minimum: 3 }, confirmation: { case_sensitive: true }


end
