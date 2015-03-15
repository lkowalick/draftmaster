require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { should have_many(:card_decks).dependent(:destroy) }
  it { should have_many(:cards).through(:card_decks) }
end
