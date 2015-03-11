class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.references :card, index: true
      t.references :type, index: true
    end
    add_foreign_key :card_types, :cards
    add_foreign_key :card_types, :types
  end
end
