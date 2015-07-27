require 'rails_helper'

RSpec.describe Draft do
  it { is_expected.to have_many(:players) }
  it { is_expected.to have_many(:rounds) }

  describe '#next_round' do
    subject { draft.next_round }

    context 'when a draft has no rounds' do
      let(:draft) { Draft.new }

      it { is_expected.to eq(1) }
    end

    context 'when a draft some rounds with numbers 1, 2, and 5' do
      let(:draft) { Draft.new }

      before do
        draft.rounds << Round.new(number: 1)
        draft.rounds << Round.new(number: 5)
        draft.rounds << Round.new(number: 2)
      end

      it { is_expected.to eq(6) }
    end

    context 'when a draft some rounds with no numbers' do
      let(:draft) { Draft.new }

      before do
        draft.rounds << Round.new
        draft.rounds << Round.new
        draft.rounds << Round.new
      end

      it { is_expected.to eq(1) }
    end
  end
end
