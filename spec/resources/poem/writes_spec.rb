require "rails_helper"

RSpec.describe PoemResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "poems",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PoemResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Poem.count }.by(1)
    end
  end

  describe "updating" do
    let!(:poem) { create(:poem) }

    let(:payload) do
      {
        data: {
          id: poem.id.to_s,
          type: "poems",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PoemResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { poem.reload.updated_at }
      # .and change { poem.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:poem) { create(:poem) }

    let(:instance) do
      PoemResource.find(id: poem.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Poem.count }.by(-1)
    end
  end
end
