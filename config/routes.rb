Rails.application.routes.draw do

  resources :users
  resources :products
  resources :sessions, only: [:new,:create,:destroy]
  resources :line_items, only: [:new,:show,:create,:destroy]
  resources :carts, only: [:new,:show,:create,:destroy]
  resources :cards
  resources :orders

  root 'home#index', as: 'home'

end
