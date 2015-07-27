class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :draft, index: true
      t.integer :number
    end
    add_foreign_key :rounds, :drafts
  end
end
