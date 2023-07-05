
Rails.application.routes.draw do

  resources :users
  resources :dishes
  resources :menus
  resources :meal_attendances
  resources :notices
  resources :preferences
  resources :reviews , only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
