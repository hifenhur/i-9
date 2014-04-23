# -*- encoding : utf-8 -*-
Inove::Application.routes.draw do
  
  resources :employees

  resources :estudos do
    
    
  end
  resources :documents
  resources :surveys

  get "home/index"
  resources :survey_versions

  resources :questions

  

  devise_for :users

  
  resources :maps do
  	resources :points
  end

  resources :points, only: :index
  root to: 'home#index'
end
