Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show', as: 'team'
  # Defines the root path route ("/")
  # root "articles#index"
end
