require "rails_helper"

RSpec.describe PoetResource, type: :resource do
  describe "serialization" do
    let!(:poet) { create(:poet) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(poet.id)
      expect(data.jsonapi_type).to eq("poets")
    end
  end

  describe "filtering" do
    let!(:poet1) { create(:poet) }
    let!(:poet2) { create(:poet) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: poet2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([poet2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:poet1) { create(:poet) }
      let!(:poet2) { create(:poet) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      poet1.id,
                                      poet2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      poet2.id,
                                      poet1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
