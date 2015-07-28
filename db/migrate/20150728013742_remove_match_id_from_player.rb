class RemoveMatchIdFromPlayer < ActiveRecord::Migration
  def change
    remove_foreign_key :players, :matches
    remove_reference :players, :match, index: true
  end
end
