Rails.application.routes.draw do
  resources :users, except: :index 
  resources :envelopes, only: [:new, :create, :show] do
  resources :parchments, only: :create
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end
