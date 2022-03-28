class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
  end

  def create
    League.create!(league_params)
    redirect_to '/leagues'
  end

  private
  def league_params
    params.permit(:name, :professional, :years_in_existence)
  end
end