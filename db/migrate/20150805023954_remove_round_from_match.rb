class RemoveRoundFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :round, :integer
  end
end
