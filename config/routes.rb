Rails.application.routes.draw do
  root 'home#index'
  resources :users, except: :index
  resources :envelopes, except: [:edit, :delete] do
    resources :parchments, only: [:create, :destroy]
  end
  get 'zipfile', to: 'zipfile#download', as: 'zipfile_download'
    get 'download', to: 'download#download_single'

  get 'sign-in', to: 'sessions#new', as: 'sign-in'
  post 'sign-in', to: 'sessions#create'
  get 'sign-up', to: 'registrations#new', as: 'sign-up'
  post 'sign-up', to: 'registrations#create'
  delete 'sign-out', to: 'sessions#destroy', as: 'sign-out'
  post '/envelopes/:id/parchments', to: 'parchments#create'
  post '/:slug/password', to: 'envelopes#authenticate'
  get '/:token/confirm_email/', to: 'registrations#confirm_email', as: 'confirm_email'
  post '/search', to: 'search#create', as: 'envelope_search'
  get '/:slug', to: 'envelopes#show', as: 'get_slug'
  post '/:slug', to: 'envelopes#update'
end
