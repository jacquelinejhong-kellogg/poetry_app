require "rails_helper"

RSpec.describe "poems#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/poems/#{poem.id}"
  end

  describe "basic destroy" do
    let!(:poem) { create(:poem) }

    it "updates the resource" do
      expect(PoemResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Poem.count }.by(-1)
      expect { poem.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
