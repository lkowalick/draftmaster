class RemovePlayerNamesFromDraft < ActiveRecord::Migration
  def change
    remove_column :drafts, :player_1, :string
    remove_column :drafts, :player_2, :string
    remove_column :drafts, :player_3, :string
    remove_column :drafts, :player_4, :string
    remove_column :drafts, :player_5, :string
    remove_column :drafts, :player_6, :string
    remove_column :drafts, :player_7, :string
    remove_column :drafts, :player_8, :string
  end
end
