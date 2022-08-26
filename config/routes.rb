Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show', as: 'team'
  get '/teams/:id/players', to: 'teams#player_list', as: 'team_player_list'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show', as: 'player'

  root 'teams#index'
end
