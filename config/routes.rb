Inove::Application.routes.draw do
  resources :survey_versions

  resources :questions

  resources :surveys

  devise_for :users

  resources :documents
  resources :maps
  root to: 'maps#index'
end
