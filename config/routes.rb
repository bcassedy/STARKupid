STARKupid::Application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :create, :update, :index]
  get 'profiles/:username', to: 'profiles#show', as: 'show_profile'
  get 'profiles/:username/edit', to: 'profiles#edit', as: 'edit_profile'
end
