class AddCompletedAndWinsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :completed, :boolean
    add_column :matches, :player_one_wins, :integer
    add_column :matches, :player_two_wins, :integer
    add_column :matches, :draws, :integer
  end
end
