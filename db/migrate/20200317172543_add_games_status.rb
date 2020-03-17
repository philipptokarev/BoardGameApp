class AddGamesStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :status, :string, default: "draft"
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
  end
end
