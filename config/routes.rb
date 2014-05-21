STARKupid::Application.routes.draw do
  get "profiles/new"
  get "profiles/show"
  get "profiles/index"
  root to: 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
