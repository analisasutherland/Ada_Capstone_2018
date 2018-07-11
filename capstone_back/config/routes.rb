Rails.application.routes.draw do
  resources :reviews, only: [:show]
  resources :recommendations
end
