Rails.application.routes.draw do
  resources :reviews, only: [:show]
  resources :games, only: %i[index show]

  resources :recommendations
end
