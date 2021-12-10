require 'rails_helper'

RSpec.describe "poets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/poets", params: params
  end

  describe 'basic fetch' do
    let!(:poet1) { create(:poet) }
    let!(:poet2) { create(:poet) }

    it 'works' do
      expect(PoetResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['poets'])
      expect(d.map(&:id)).to match_array([poet1.id, poet2.id])
    end
  end
end
