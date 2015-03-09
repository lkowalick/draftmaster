class AddManaCostAndCmcToCards < ActiveRecord::Migration
  def change
    add_column :cards, :mana_cost, :string
    add_column :cards, :cmc, :integer
  end
end
