class ChangeNameIndexOnCards < ActiveRecord::Migration
  def change
    remove_index :cards, :name
    add_index :cards, [:name, :set], unique: true
  end
end
