require 'rails_helper'

RSpec.describe "poets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/poets/#{poet.id}"
  end

  describe 'basic destroy' do
    let!(:poet) { create(:poet) }

    it 'updates the resource' do
      expect(PoetResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Poet.count }.by(-1)
      expect { poet.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
