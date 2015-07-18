require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    login_as(User.find_by!(email: 'test@example.com'),
             scope: :user)
  end

  let(:deckname) { "deckname-#{SecureRandom.hex}" }

  let(:card) do
    Card.first
  end

  scenario 'Create a deck, add a card, then remove a card' do
    visit '/'

    expect(page).to have_content 'MtG Draft Master'

    fill_in 'deck_name', with: deckname
    click_on 'Create Deck'

    expect(page).to have_content deckname

    fill_in 'card_number', with: card.number
    select card.set, from: 'card_set'
    click_on 'Add Card'

    expect(page).to have_content card.name

    card_deck = CardDeck.find_by!(deck: Deck.first, card: card)

    find("a[href='#{card_deck_path(card_deck)}']").click

    expect(page).to_not have_content card.name
  end

  describe 'Default card set' do
    before do
      visit '/'
      fill_in 'deck_name', with: deckname
      click_on 'Create Deck'
    end

    scenario 'when a card has just been selected' do
      fill_in 'card_number', with: card.number
      select card.set, from: 'card_set'
      click_on 'Add Card'

      expect(page.has_select?('card_set', selected: card.set)).to be_truthy
    end
  end

  describe 'Easily adding lands' do
    before do
      visit '/'
      fill_in 'deck_name', with: deckname
      click_on 'Create Deck'
    end

    scenario 'adding lands easily' do
      click_on 'Forest'
      click_on 'Island'
      click_on 'Mountain'
      click_on 'Swamp'
      click_on 'Plains'

      expect(page).to have_css 'li', text: 'Forest'
      expect(page).to have_css 'li', text: 'Island'
      expect(page).to have_css 'li', text: 'Plains'
      expect(page).to have_css 'li', text: 'Swamp'
      expect(page).to have_css 'li', text: 'Mountain'
    end
  end
end
