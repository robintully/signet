Rails.application.routes.draw do
  resources :users, except: :index
  resources :envelopes, except: [:delete] do
  resources :parchments, only: :create
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'envelopes#new'
  get 'sign-in', to: 'sessions#new', as: 'sign-in'
  post 'sign-in', to: 'sessions#create'
  get 'sign-up', to: 'registrations#new', as: 'sign-up'
  post 'sign-up', to: 'registrations#create'
  delete 'sign-out', to: 'sessions#destroy', as: 'sign-out'
end
