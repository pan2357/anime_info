Rails.application.routes.draw do
  resources :news
  resources :sources
  resources :platforms
  resources :animes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
