Inove::Application.routes.draw do
  resources :estudos

  get "home/index"
  resources :survey_versions

  resources :questions

  resources :surveys

  devise_for :users

  resources :documents
  resources :maps do
  	resources :points
  end
  root to: 'home#index'
end
