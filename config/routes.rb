Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  post '/teams', to: 'teams#create'
  get '/teams/new', to: 'teams#new', as: 'new_team'
  get '/teams/:id', to: 'teams#show', as: 'team'
  get '/teams/:id/edit', to: 'teams#edit', as: 'edit_team'
  patch '/teams/:id', to: 'teams#update'
  
  get '/teams/:team_id/players/new', to: 'players#new', as: 'new_team_player'
  get '/teams/:id/players', to: 'teams#player_list', as: 'team_player_list'
  post '/teams/:team_id/players', to: 'players#create', as: 'create_team_player'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show', as: 'player'
  get '/players/:id/edit', to: 'players#edit', as: 'edit_player'
  patch '/players/:id', to: 'players#update', as: 'update_player'

  root 'teams#index'
end
