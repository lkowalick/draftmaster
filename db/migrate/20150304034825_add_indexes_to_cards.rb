class AddIndexesToCards < ActiveRecord::Migration
  def change
    add_index :cards, :name, unique: true
    add_index :cards, [:number, :set], unique: true
  end
end
