Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  
  resources :registered_applications
  resources :events
  root 'welcome#index'
  
  namespace :api, defaults: { format: :json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  
  namespace :api, defaults: { format: :json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
