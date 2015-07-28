class AddPlayerOneIdAndPlayerTwoIdToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :player_one_id, :integer, index: true
    add_foreign_key :matches, :players, column: :player_one_id
    add_column :matches, :player_two_id, :integer, index: true
    add_foreign_key :matches, :players, column: :player_two_id
  end
end
