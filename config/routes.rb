Inove::Application.routes.draw do
  get "home/index"
  resources :survey_versions

  resources :questions

  resources :surveys

  devise_for :users

  resources :documents
  resources :maps
  root to: 'home#index'
end
