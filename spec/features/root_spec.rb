require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    login_as(User.create!(email: 'fake@example.com',
                          password: 'fakepass',
                          password_confirmation: 'fakepass'),
             scope: :user)
  end

  let(:deckname) { "deckname-#{SecureRandom.hex}" }

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
end
