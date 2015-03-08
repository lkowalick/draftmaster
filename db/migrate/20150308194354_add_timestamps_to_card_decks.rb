class AddTimestampsToCardDecks < ActiveRecord::Migration
  def change
    add_timestamps :card_decks
  end
end
