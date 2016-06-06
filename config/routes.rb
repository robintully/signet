Rails.application.routes.draw do
  root 'envelopes#new'
  resources :users, except: :index
  resources :envelopes, except: [:delete] do
    resources :parchments, only: :create
  end
  get 'sign-in', to: 'sessions#new', as: 'sign-in'
  post 'sign-in', to: 'sessions#create'
  get 'sign-up', to: 'registrations#new', as: 'sign-up'
  post 'sign-up', to: 'registrations#create'
  delete 'sign-out', to: 'sessions#destroy', as: 'sign-out'
  post '/envelopes/:id/parchments', to: 'parchments#create'
  get '/:id', to: 'envelopes#show'
end
