class AddNonnullableUserIdToDeck < ActiveRecord::Migration
  def change
    MigrationDeck.where(user_id: nil).each do |deck|
      deck.user = MigrationUser.first
      deck.save!
    end
    change_column_null :decks, :user_id, false
  end

  class MigrationUser < ActiveRecord::Base
    self.table_name = 'users'
  end

  class MigrationDeck < ActiveRecord::Base
    self.table_name = 'decks'
  end
end
