Rails.application.routes.draw do
  root to: 'pages#front'

  get 'rules', to: 'pages#rules'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  resources :cards, only: [:new, :create, :edit, :update, :show, :index]

  resources :card_types, only: [:new, :create, :edit, :update]

  resources :card_subtypes, only: [:new, :create, :edit, :update]

  resources :factions, except: [:destroy]

  resources :expansions, except: [:destroy]

  resources :users, only: [:show, :create, :edit, :update, :new]
end
