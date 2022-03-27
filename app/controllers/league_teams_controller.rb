class LeagueTeamsController < ApplicationController
  def index
    league = League.find(params[:league_id])
    @teams = league.teams
    # require "pry"; binding.pry
  end
end