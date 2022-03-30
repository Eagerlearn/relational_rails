class TeamsController < ApplicationController
  def index
    @teams = Team.true_expansion_teams
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  private
  def team_params
    params.permit(:name, :expansion_team, :number_of_players)
  end
end