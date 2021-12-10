require 'rails_helper'

RSpec.describe PoetResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'poets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PoetResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Poet.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:poet) { create(:poet) }

    let(:payload) do
      {
        data: {
          id: poet.id.to_s,
          type: 'poets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PoetResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { poet.reload.updated_at }
      # .and change { poet.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:poet) { create(:poet) }

    let(:instance) do
      PoetResource.find(id: poet.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Poet.count }.by(-1)
    end
  end
end
