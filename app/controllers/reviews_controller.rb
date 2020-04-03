class ReviewsController < ApplicationController
  expose :game, find: ->(id, scope){ scope.find(id) }
  expose :review

  def new; end

  def create
    review = game.reviews.new(review_params.merge(user_id: current_user.id))
    if review.save
      calc_rate
      flash[:success] = "Review created"
      redirect_to game_path(game)
    else
      render :new
    end
  end

  def edit; end

  def update
    if review.update(review_params)
      calc_rate
      flash[:success] = "Review updated"
      redirect_to game_path(game)
    else
      render :edit
    end
  end

  def destroy
    review.destroy
    calc_rate
    flash[:success] = "Review deleted"
    redirect_to game_path(game)
  end

  private
  def review_params
    params.require(:review).permit(:review, :rating)
  end

  def calc_rate
    game.rating = game.average_rating
    game.save
  end
end
