class RemoveNameIndexFromCards < ActiveRecord::Migration
  def change
    remove_index :cards, [:name, :set]
  end
end
