Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/leagues', to: 'leagues#index'
  get '/leagues/new', to: 'leagues#new'
  post '/leagues', to: 'leagues#create'
  get '/leagues/:id', to: 'leagues#show'

  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'

  get '/leagues/:league_id/teams', to: 'league_teams#index'
end
