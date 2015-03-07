class CreateCardDecks < ActiveRecord::Migration
  def change
    create_table :card_decks do |t|
      t.references :deck, index: true
      t.references :card, index: true
    end
    add_foreign_key :card_decks, :decks
    add_foreign_key :card_decks, :cards
  end
end
