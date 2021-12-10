require "rails_helper"

RSpec.describe "poets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/poets/#{poet.id}", payload
  end

  describe "basic update" do
    let!(:poet) { create(:poet) }

    let(:payload) do
      {
        data: {
          id: poet.id.to_s,
          type: "poets",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PoetResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { poet.reload.attributes }
    end
  end
end
