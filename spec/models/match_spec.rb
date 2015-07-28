require 'rails_helper'

RSpec.describe Match do
  it { is_expected.to belong_to(:round) }
  it { is_expected.to belong_to(:player_one) }
  it { is_expected.to belong_to(:player_two) }
end
