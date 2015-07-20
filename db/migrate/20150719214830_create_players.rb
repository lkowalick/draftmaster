class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :draft, index: true
      t.integer :first_round_wins
      t.integer :first_round_losses
      t.integer :second_round_wins
      t.integer :second_round_losses
      t.integer :third_round_wins
      t.integer :third_round_losses
    end
    add_foreign_key :players, :drafts
  end
end
