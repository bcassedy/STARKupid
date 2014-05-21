STARKupid::Application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :create]
  get 'profiles/:username', to: 'profiles#show', as: 'profile'
end
