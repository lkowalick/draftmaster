require 'rails_helper'

RSpec.describe DecksController, type: :controller do

  describe "POST #create" do
    context 'with good parameters' do
      let(:params) do
        { deck: { name: 'deck_name' } }
      end

      it "redirect me to the newly create deck" do
        post :create, params
        expect(response).to have_http_status(302)
      end
    end
  end
end
