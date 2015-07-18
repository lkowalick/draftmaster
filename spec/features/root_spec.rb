require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    login_as(User.find_by!(email: 'test@example.com'),
             scope: :user)
  end

  scenario 'Create a new draft and add players to it' do
    visit '/'
    click_on 'Create Draft'
    expect(page).to have_content 'Add Player'
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

    click_on 'Logout'
    login_as(User.create!(email: 'anotherfake@example.com',
                          password: 'fakepass',
                          password_confirmation: 'fakepass'),
             scope: :user)
    visit '/'

    click_on 'Deck One'
    expect(page).to_not have_button('Add Card')
  end
end
