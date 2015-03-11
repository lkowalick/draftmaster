require 'rails_helper'

RSpec.describe Card do
  it { is_expected.to validate_uniqueness_of(:number).scoped_to(:set) }
  it { is_expected.to validate_presence_of(:set) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:card_types) }
  it { is_expected.to have_many(:types).through(:card_types) }
end
