class GamesController < ApplicationController
  def index
    params[:game_count] = 6
    @games = FindGame.new(Game.published).call(permitted_params)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def permitted_params
    params.permit(:sort_column, :sort_direction, :game_count, :page)
  end
end
