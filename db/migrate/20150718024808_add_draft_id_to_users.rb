class AddDraftIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :draft, index: true
    add_foreign_key :users, :drafts
  end
end
