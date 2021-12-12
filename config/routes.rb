Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :mylists
  resources :follows
  resources :news
  resources :sources
  resources :platforms
  resources :animes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'register', to: 'users#register', as: 'register'
  post 'register', to: 'users#create_new_user'

  get 'login', to: 'users#login_page', as: 'login'
  post 'login', to: 'users#login'

  get 'logout', to: 'users#logout', as: 'logout'

  get 'feed', to: 'users#feed', as: 'feed'

  get 'my_list', to: 'users#my_list', as: 'my_list'
  post 'my_list', to: 'mylists#save_my_list'
  delete 'my_list', to: 'mylists#unsave_my_list'

  get 'home', to: 'animes#home', as: 'home'

  get 'anime_page/:name', to: 'animes#anime_page', as: 'anime_page'
  get 'source_page/:name', to: 'sources#source_page', as: 'source_page'
  get 'news_page/:id', to: 'news#news_page', as: 'news_page'

  post 'like', to: 'likes#like_asn', as: 'like_manager'
  delete 'like', to: 'likes#unlike_asn'

  post 'follow', to: 'follows#follow_a', as: 'follow_manager'
  delete 'follow', to: 'follows#unfollow_a'

  post 'comment', to: 'comments#comment_asn', as: 'comment_manager'
  delete 'comment', to: 'comments#uncomment_asn'
end
