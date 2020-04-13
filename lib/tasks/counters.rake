namespace :counters do
  task update: :environment do
    Game.find_each do |game|
      Game.reset_counters(game.id, :reviews)
    end
  end
end
