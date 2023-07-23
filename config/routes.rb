# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :dishes
  resources :menus
  resources :meal_attendances
  resources :notices
  resources :preferences
  resources :reviews, only: %i[new create destroy]
  root 'menus#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '*path' => redirect('/')
end