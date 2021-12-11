json.extract! source, :id, :name, :category, :desc, :anime_id, :image, :created_at, :updated_at
json.url source_url(source, format: :json)
json.image url_for(source.image)
