class LeagueTeamsController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @teams = @league.teams
  end

  def new
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    team = @league.teams.create!(team_params)
    redirect_to "/leagues/#{@league.id}/teams"
  end

  private
  def team_params
    params.permit(:name, :expansion_team, :number_of_players)
  end
end