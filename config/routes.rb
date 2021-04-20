Rails.application.routes.draw do
  
  devise_for :users
  root to: "home#top"
  resources :users
  resources :trashes
  resources :pick_ups
end
