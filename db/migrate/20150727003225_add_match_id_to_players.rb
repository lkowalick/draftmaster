class AddMatchIdToPlayers < ActiveRecord::Migration
  def change
    add_reference :players, :match, index: true
    add_foreign_key :players, :matches
  end
end
