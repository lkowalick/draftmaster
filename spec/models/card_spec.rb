require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to validate_uniqueness_of(:number).scoped_to(:set) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
