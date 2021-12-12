class User < ApplicationRecord
    has_secure_password

    validates :name, uniqueness: { case_sensitive: false }, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true, length: { minimum: 3 }, confirmation: { case_sensitive: true }

    has_many :follows
    has_many :followed_animes, through: :follows, source: :anime, class_name: 'Anime'

    has_many :mylists
    has_many :saved_animes, through: :mylists, source: :anime, class_name: 'Anime'

    has_many :likes
    has_many :liked_animes, through: :likes, source: :likeable, source_type: 'Anime'
    has_many :liked_sources, through: :likes, source: :likeable, source_type: 'Source'
    has_many :liked_news, through: :likes, source: :likeable, source_type: 'News'

    has_many :comments
    has_many :commented_animes, through: :comments, source: :commentable, source_type: 'Anime'
    has_many :commented_sources, through: :comments, source: :commentable, source_type: 'Source'
    has_many :commented_news, through: :comments, source: :commentable, source_type: 'News'

    def get_feed_anime
        return Anime.select("*,(day_in_week+7-#{Time.now.getlocal.wday})%7 AS wday").where(id: self.followed_animes.pluck('id'), on_air: true).order("wday, show_time")
    end
    

end
