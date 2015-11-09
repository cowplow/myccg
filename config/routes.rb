Rails.application.routes.draw do
  root to: 'pages#front'

  resources :cards, only: [:new, :create, :edit, :update]

  resources :card_types, only: [:new, :create, :edit, :update]

  resources :card_subtypes, only: [:new, :create, :edit, :update]

  resources :factions, except: [:destroy]

  resources :expansions, except: [:destroy]
end
