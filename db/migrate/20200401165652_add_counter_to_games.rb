class AddCounterToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :reviews_count, :integer
  end
end
