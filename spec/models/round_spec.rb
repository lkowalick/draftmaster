require 'rails_helper'

RSpec.describe Round do
  it { is_expected.to belong_to(:draft) }
  it { is_expected.to have_many(:matches) }

  describe '#complete' do
    subject { round.complete }

    let(:round) { Round.new }

    context 'no matches' do
      it { is_expected.to be_truthy }
    end

    context 'two complete matches' do
      before do
        round.matches.build(completed: true)
        round.matches.build(completed: true)
      end

      it { is_expected.to be_truthy }
    end

    context 'two incomplete matches' do
      before do
        round.matches.build(completed: false)
        round.matches.build(completed: false)
      end

      it { is_expected.to be_falsey }
    end

    context 'one and complete and one incomplete' do
      before do
        round.matches.build(completed: true)
        round.matches.build(completed: false)
      end

      it { is_expected.to be_falsey }
    end

  end
end
