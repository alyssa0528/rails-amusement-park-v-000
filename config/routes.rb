Rails.application.routes.draw do

  root "static#home"
  post "/users/new", to: "users#create"
  get "/signin", to: "users#signin"
  post "/signin", to: "users#signin"
  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:index]
end
