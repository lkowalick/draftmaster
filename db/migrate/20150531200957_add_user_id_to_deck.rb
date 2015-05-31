class AddUserIdToDeck < ActiveRecord::Migration
  def change
    add_reference :decks, :user, index: true
    add_foreign_key :decks, :users
  end
end
