require "rails_helper"

RSpec.describe "poems#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/poems", params: params
  end

  describe "basic fetch" do
    let!(:poem1) { create(:poem) }
    let!(:poem2) { create(:poem) }

    it "works" do
      expect(PoemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["poems"])
      expect(d.map(&:id)).to match_array([poem1.id, poem2.id])
    end
  end
end
