class GamesController < ApplicationController
  def index
    @games = FindGame.new(Game.where(status: :published)).call(permitted_params)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def permitted_params
    params.permit(:sort_column, :sort_direction, :game_count)
  end
end
