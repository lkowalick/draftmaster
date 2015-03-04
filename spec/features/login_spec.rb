require 'rails_helper'

RSpec.describe 'the main index page' do
  it 'presents me with an interface' do
    visit '/'
    expect(page).to have_content 'MtG Draft Master'
  end
end
