require 'rails_helper'

RSpec.describe 'the main index page' do
  let(:deckname) { SecureRandom.uuid }

  let(:card) do
    Card.where(name: SecureRandom.uuid,
               number: 1,
               set: 'KTK').first_or_create!
  end

  before do
    visit '/'
  end

  it 'presents me with an interface' do
    expect(page).to have_content 'MtG Draft Master'
  end

  describe 'creating a new deck name' do
    before do
      fill_in 'deck_name', with: deckname
      click_on 'Create Deck'
    end

    it 'sends me to the newly created deck' do
      expect(page).to have_content deckname
    end

    describe 'adding a card' do
      before do
        fill_in 'card_number', with: card.number
        click_on 'Add Card'
      end

      it 'adds the card to the page' do
        expect(page).to have_content card.name
      end
    end
  end
end
