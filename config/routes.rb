Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/capture', to: 'pokemon#capture', as: 'capture'
  patch '/damage', to: 'pokemon#damage', as: 'damage'
  get '/new', to: 'pokemon#new', as: 'new'
  post '/create', to: 'pokemon#create', as: 'create'
  patch '/heal', to: 'pokemon#heal', as: 'heal'
end