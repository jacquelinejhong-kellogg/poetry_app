require "rails_helper"

RSpec.describe "poems#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/poems/#{poem.id}", payload
  end

  describe "basic update" do
    let!(:poem) { create(:poem) }

    let(:payload) do
      {
        data: {
          id: poem.id.to_s,
          type: "poems",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PoemResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { poem.reload.attributes }
    end
  end
end
