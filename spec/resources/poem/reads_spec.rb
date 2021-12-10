require 'rails_helper'

RSpec.describe PoemResource, type: :resource do
  describe 'serialization' do
    let!(:poem) { create(:poem) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(poem.id)
      expect(data.jsonapi_type).to eq('poems')
    end
  end

  describe 'filtering' do
    let!(:poem1) { create(:poem) }
    let!(:poem2) { create(:poem) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: poem2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([poem2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:poem1) { create(:poem) }
      let!(:poem2) { create(:poem) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            poem1.id,
            poem2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            poem2.id,
            poem1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
