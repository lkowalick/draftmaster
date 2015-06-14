require 'rails_helper'

RSpec.describe DecksController, type: :controller do
  describe 'POST #create' do

    context 'with good parameters' do
      let(:params) do
        { deck: { name: 'deck_name', user_id: user.id } }
      end

      let(:user) do
        User.create!(email: 'fake@exampe.com',
                     password: 'fakepass',
                     password_confirmation: 'fakepass')
      end

      let(:other_user) do
        User.create!(email: 'anotherfake@exampe.com',
                     password: 'fakepass',
                     password_confirmation: 'fakepass')
      end

      let(:type) { Type.find_or_create_by!(name: 'Land') }

      let!(:card) do
        card = Card.where(mana_cost: '1UG',
                          name: "card-#{SecureRandom.hex}",
        number: 1,
          cmc: 1,
          set: 'set_1').first_or_create!

        CardType.create!(card: card, type: type)

        card
      end

      it 'redirect me to the newly create deck' do
        sign_in user
        @request.headers["Accept"] = "application/json"
        post :create, params
        expect(response).to be_successful
      end

      describe 'deck access control' do
        context 'when someone else has a deck' do
          let!(:deck) { Deck.create!(name: 'A new one', user: user) }

          let(:update_params) do
            params.tap do |p|
              p[:id] = deck.id
              p[:card] = { numer: card.number, set: card.set }
            end
          end

          let(:destroy_params) { { id: deck.id } }

          it "doesn't let a user edit a different user's deck" do
            sign_in other_user
            @request.headers["Accept"] = "application/json"
            patch :update, update_params
            expect(response).to be_forbidden
          end

          it "doesn't let a user edit a different user's deck" do
            sign_in other_user
            @request.headers["Accept"] = "application/json"
            delete :destroy, destroy_params
            expect(response).to be_forbidden
          end
        end
      end
    end
  end
end
