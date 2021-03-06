Rails.application.routes.draw do

  root "static#home"
  post "/users/new", to: "users#create"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:index, :show]
end
