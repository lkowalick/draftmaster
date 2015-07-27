class CreateMatch < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :draft, index: true
      t.integer :round
    end
    add_foreign_key :matches, :drafts
  end
end
