Rails.application.routes.draw do
  resources :reviews, only: [:show]
  resources :games
  resources :recommendations
end
