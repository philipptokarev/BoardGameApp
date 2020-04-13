class Admin::GamesController < Admin::BaseController
  expose :game

  def index
    @games = FindGame.new(Game.all).call(permitted_params)
  end

  def new
  end

  def create
    game = Game.new(game_params)
    if game.save
      flash[:success] = "Game added"
      redirect_to admin_games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if game.update(game_params)
      flash[:success] = "Game updated"
      redirect_to admin_games_path
    else
      render :edit
    end
  end

  def destroy
    game.destroy
    flash[:success] = "Game deleted"
    redirect_to admin_games_path
  end

  private

  def permitted_params
    params.permit(:sort_column, :sort_direction, :game_count, :page)
  end

  def game_params
    params.require(:game).permit(:name, :description, :video, :reference, :image, :status)
  end
end
