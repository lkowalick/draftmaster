require 'rails_helper'

RSpec.describe 'the main index page' do
  let(:deckname) { SecureRandom.uuid }

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
  end
end
