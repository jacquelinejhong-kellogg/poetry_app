require 'rails_helper'

RSpec.describe "poets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/poets/#{poet.id}", params: params
  end

  describe 'basic fetch' do
    let!(:poet) { create(:poet) }

    it 'works' do
      expect(PoetResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('poets')
      expect(d.id).to eq(poet.id)
    end
  end
end
