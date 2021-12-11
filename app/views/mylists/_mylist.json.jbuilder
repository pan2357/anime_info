json.extract! mylist, :id, :user_id, :anime_id, :created_at, :updated_at
json.url mylist_url(mylist, format: :json)
