json.extract! anime, :id, :name, :synopsis, :day_in_week, :show_time, :on_air, :episode, :image, :created_at, :updated_at
json.url anime_url(anime, format: :json)
json.image url_for(anime.image)
