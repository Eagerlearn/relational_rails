Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/leagues', to: 'leagues#index'
  get '/leagues/new', to: 'leagues#new'
  post '/leagues', to: 'leagues#create'
  get '/leagues/:id', to: 'leagues#show'
  get '/leagues/:id/edit', to: 'leagues#edit'
  patch '/leagues/:id', to: 'leagues#update'
  delete '/leagues/:id', to: 'leagues#destroy'

  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get 'teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'

  get '/leagues/:league_id/teams', to: 'league_teams#index'
  get '/leagues/:league_id/teams/new', to: 'league_teams#new'
  post '/leagues/:league_id/teams', to: 'league_teams#create'
end
