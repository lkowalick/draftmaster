require 'rails_helper'

RSpec.feature 'Creating a deck and adding some cards' do
  before do
    login_as(User.find_by!(email: 'test@example.com'),
             scope: :user)
  end

  scenario 'Create a new draft and add players to it' do
    visit '/'
    click_on 'Create Draft'

    expect(page).to have_content 'Players'

    fill_in 'draft_players_attributes_0_name', with: 'Player One'
    fill_in 'draft_players_attributes_1_name', with: 'Player Two'
    fill_in 'draft_players_attributes_2_name', with: 'Player Three'
    fill_in 'draft_players_attributes_3_name', with: 'Player Four'
    fill_in 'draft_players_attributes_4_name', with: 'Player Five'
    fill_in 'draft_players_attributes_5_name', with: 'Player Six'
    fill_in 'draft_players_attributes_6_name', with: 'Player Seven'
    fill_in 'draft_players_attributes_7_name', with: 'Player Eight'

    click_on 'Create Draft'

    expect(page).to have_content 'Player One'
    expect(page).to have_content 'Player Two'
    expect(page).to have_content 'Player Three'
    expect(page).to have_content 'Player Four'
    expect(page).to have_content 'Player Five'
    expect(page).to have_content 'Player Six'
    expect(page).to have_content 'Player Seven'
    expect(page).to have_content 'Player Eight'

    click_on 'Pair Round One'
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
