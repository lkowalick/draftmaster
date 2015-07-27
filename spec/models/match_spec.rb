require 'rails_helper'

RSpec.describe Match do
  it { is_expected.to have_many(:players) }
  it { is_expected.to belong_to(:round) }
end
