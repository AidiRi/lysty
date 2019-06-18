Rails.application.routes.draw do
  resources :users
  resources :lists
  resources :stores, only: [:index, :show]
  resources :products, only: [:index, :show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
