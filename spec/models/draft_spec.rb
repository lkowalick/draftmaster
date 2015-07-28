require 'rails_helper'

RSpec.describe Draft do
  it { is_expected.to have_many(:players) }
  it { is_expected.to have_many(:rounds) }
end
