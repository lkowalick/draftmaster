require 'rails_helper'

RSpec.describe DecksController, type: :controller do

  describe "POST #create" do
    context 'with good parameters' do
      let(:params) do
        { deck: { name: 'deck_name' } }
      end

      let(:user) do
        User.create!(email: 'fake@exampe.com',
                     password: 'fakepass',
                     password_confirmation: 'fakepass')
      end

      it "redirect me to the newly create deck" do
        sign_in user
        post :create, params
        expect(response).to have_http_status(302)
      end
    end
  end
end
