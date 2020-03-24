class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name, default: ""
      t.string :email, null: false
      t.text :text, default: ""
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :messages, :user_id
  end
end
