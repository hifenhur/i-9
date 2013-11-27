Inove::Application.routes.draw do
  resources :estudos do
    resources :documents
    resources :surveys
    
  end

  get "home/index"
  resources :survey_versions

  resources :questions

  

  devise_for :users

  
  resources :maps do
  	resources :points
  end
  root to: 'home#index'
end
