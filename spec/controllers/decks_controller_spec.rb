require 'rails_helper'

RSpec.describe DecksController, type: :controller do

  describe "POST #create" do
    context 'with good parameters' do
      let(:params) do
        { deck: { name: 'deck_name' } }
      end

      let(:user) { 'covermymeds' }
      let(:pw) { 'draft2015' }

      it "redirect me to the newly create deck" do
        @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)

        post :create, params
        expect(response).to have_http_status(302)
      end
    end
  end
end
