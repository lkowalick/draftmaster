require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:card_decks).dependent(:destroy) }
  it { is_expected.to have_many(:cards).through(:card_decks) }
end
