Rails.application.routes.draw do
  resources :mylists
  resources :follows
  resources :news
  resources :sources
  resources :platforms
  resources :animes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
