class AddValidateToMessage < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :name, :string, null: false
    change_column :messages, :text, :text, null: false
  end
end
