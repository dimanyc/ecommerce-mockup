Rails.application.routes.draw do

  resources :users, only: [:new,:create,:show]
  resources :products
  resources :sessions, only: [:new,:create,:destroy]
  resources :line_items, only: [:new,:show,:create,:destroy]
  resources :carts, only: [:new,:show,:create,:destroy]
  resources :cards, only: [:new,:create,:destroy]
  resources :orders, only: [:new,:create,:destroy] 

  root 'products#index', as: 'home'

end
