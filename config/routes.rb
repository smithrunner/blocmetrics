Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  resources :registered_applications
  root 'welcome#index'
end
