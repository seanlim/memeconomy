class AddAboutToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about, :text, default: "Hello! This is my Memeconomy profile!"
  end
end
