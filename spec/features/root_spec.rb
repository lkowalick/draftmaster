require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    login_as(User.create!(email: 'fake@example.com',
                          password: 'fakepass',
                          password_confirmation: 'fakepass'),
             scope: :user)
  end

  let(:deckname) { "deckname-#{SecureRandom.hex}" }
  let(:set) { "set-#{SecureRandom.hex}" }
  let(:type) { Type.find_or_create_by!(name: 'Land') }
  %i(swamp plains island mountain forest).each_with_index do |land, i|
    let!(land) do
      card = Card.where(mana_cost: '',
                        name: land.to_s.titleize,
                        number: 101 + i,
                        cmc: 0,
                        set: set).first_or_create!

      CardType.create!(card: card, type: type)

      card
    end
  end

  scenario 'View and edit decks at root' do
    visit '/'
    fill_in 'deck_name', with: 'Deck One'
    click_on 'Create Deck'

    click_on 'Home'

    fill_in 'deck_name', with: 'Deck Two'
    click_on 'Create Deck'

    click_on 'Home'

    expect(page).to have_content 'Deck One'
    expect(page).to have_content 'Deck Two'

    click_on 'Delete Deck One'

    expect(page).to_not have_content 'Deck One'
  end

  scenario 'Deck Access Control' do
    visit '/'
    fill_in 'deck_name', with: 'Deck One'
    click_on 'Create Deck'

    logout(:user)
    login_as(User.create!(email: 'anotherfake@example.com',
                          password: 'fakepass',
                          password_confirmation: 'fakepass'),
             scope: :user)
    visit '/'

    click_on 'Deck One'
    expect(page).to_not have_button('Add Card')
  end
end
