STARKupid::Application.routes.draw do
  root to: 'sessions#landing'
  get 'sessions/guest', to: 'sessions#guest', as: 'guest_session'
  namespace :api, defaults: { format: :json } do
    get 'visitors', to: 'visits#index'
    resources :favorites, only: [:index, :create]
    delete 'favorites/:username', to: 'favorites#destroy'
    resources :questions, only: [:index, :show] do
      resources :answered_questions, only: [:create]
    end
    post 'profiles/search', to: 'profiles#search', as: 'profiles_search'
    resources :profiles, except: [:new, :edit] do
      resources :messages, only: [:create]
    end
    resources :messages, only: [:index, :show, :destroy]
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # resources :profiles, only: [:new, :create, :update, :index]
  get 'profiles/:username/messages/new', to: 'messages#new', as: 'new_message'
  post 'profiles/:username/messages', to: 'messages#create', as: 'make_message'
  get 'profiles/:username', to: 'profiles#show', as: 'show_profile'
  get 'profiles/:username/edit', to: 'profiles#edit', as: 'edit_profile'
  resources :messages, only: [:index, :show]
end
