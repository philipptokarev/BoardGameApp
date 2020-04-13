class FindGame
  attr_reader :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = sort(initial_scope, params[:sort_column], params[:sort_direction])
    scoped = paginate(scoped, params)
    scoped
  end

  private

  def sort(scoped, sort_column, sort_direction)
    sort_direction ||= :asc
    sort_column ||= :name
    scoped.order(sort_column => sort_direction)
  end

  def paginate(scoped, params)
    scoped.page(page(params)).per(game_count(params))
  end

  def page(params)
    params[:page] || 1
  end

  def game_count(params)
    params[:game_count] || 6
  end
end
