require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    page.driver.browser.basic_authorize('covermymeds', 'draft2015')
  end

  let(:deckname) { SecureRandom.uuid }

  let!(:card) do
    Card.where(mana_cost: '1UG',
               name: SecureRandom.uuid,
               number: 1,
               cmc: 1,
               set: SecureRandom.uuid).first_or_create!
  end

  let!(:other_card) do
    Card.where(name: SecureRandom.uuid,
               number: 2,
               cmc: 2,
               mana_cost: '2GB',
               set: SecureRandom.uuid).first_or_create!
  end

  scenario "Create a deck and add a card" do
    visit '/'

    expect(page).to have_content 'MtG Draft Master'

    fill_in 'deck_name', with: deckname
    click_on 'Create Deck'

    expect(page).to have_content deckname

    fill_in 'card_number', with: card.number
    select card.set, from: 'card_set'
    click_on 'Add Card'

    expect(page).to have_content card.name
    expect(page).to have_content card.mana_cost
  end

  describe "Default card set" do
    before do
      visit '/'
      fill_in 'deck_name', with: deckname
      click_on 'Create Deck'
    end

    scenario "when a card has just been selected" do
      fill_in 'card_number', with: card.number
      select card.set, from: 'card_set'
      click_on 'Add Card'

      expect(page.has_select?('card_set', selected: card.set)).to be_truthy
    end
  end

  describe "Easily adding lands" do
    before do
      visit '/'
      fill_in 'deck_name', with: deckname
      click_on 'Create Deck'
    end

    scenario "adding lands easily" do
      select 'forest', from: 'land'
      fill_in 'land_quantity', with: 6
      click_on 'Add Lands'

      expect(page).to have_content 'forest'
    end
  end
end
