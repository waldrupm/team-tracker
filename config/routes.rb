Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show', as: 'team'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show', as: 'player'
  # Defines the root path route ("/")
  # root "articles#index"
end
