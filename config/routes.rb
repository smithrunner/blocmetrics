Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  resources :registered_applications
  resources :events
  root 'welcome#index'
end
