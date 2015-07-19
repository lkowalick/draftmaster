class AddPlayersToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :player_1, :string
    add_column :drafts, :player_2, :string
    add_column :drafts, :player_3, :string
    add_column :drafts, :player_4, :string
    add_column :drafts, :player_5, :string
    add_column :drafts, :player_6, :string
    add_column :drafts, :player_7, :string
    add_column :drafts, :player_8, :string
  end
end
