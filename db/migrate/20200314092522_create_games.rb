class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.float :rating
      t.string :video
      t.string :reference
      t.string :image, null: false

      t.timestamps
    end
  end
end
