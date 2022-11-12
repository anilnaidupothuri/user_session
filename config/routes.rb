# frozen_string_literal: true

Rails.application.routes.draw do

  root 'sessions#home'
  get 'signup', to: 'users#new'
post 'signup', to: 'users#create'
resources :users, except:[:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
