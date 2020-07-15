# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'sessions#welcome'
  #  get 'sessions/new'
  #  get 'sessions/create'
  #  get 'sessions/login'
  #  get 'sessions/welcome'
  #  get 'users/new'
  #  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[new create]
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
