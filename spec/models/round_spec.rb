require 'rails_helper'

RSpec.describe Round do
  it { is_expected.to belong_to(:draft) }
  it { is_expected.to have_many(:matches) }
end