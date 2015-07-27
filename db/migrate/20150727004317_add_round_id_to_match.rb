class AddRoundIdToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :round, index: true
    add_foreign_key :matches, :rounds
  end
end
