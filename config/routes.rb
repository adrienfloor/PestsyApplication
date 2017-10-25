Rails.application.routes.draw do

  get 'pages/index'

  root to: "pages#index"

  get '/profil', to: 'users#edit', as: :profil
  patch '/profil', to: 'users#update'

  get '/animaux/:slug', to: 'posts#species', as: :species_posts

  # sessions

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :pets do
    resource :subscriptions, only: [:create, :destroy]
  end
  resources :posts do
    collection do
      get 'me'
    end
  end
  resources :passwords, only: [:new, :create, :edit, :update]
  # resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create] do
    member do
      get 'confirm'
    end
  end

end
