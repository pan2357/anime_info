json.extract! news, :id, :headline, :content, :image, :created_at, :updated_at
json.url news_url(news, format: :json)
json.image url_for(news.image)
