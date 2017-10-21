require "securerandom"
require "spec_helper"

RSpec.describe Cloth::Item do
  let(:rec_count) { 5 }
  let(:item_id) { SecureRandom.uuid }
  before {
    Cloth.client.stub(:get) {
      JSON.parse(
        JSON.generate(
          items: rec_count.times.map { SecureRandom.uuid }
        )
      )
    }

    Cloth.client.stub(:post) {
      JSON.parse(
        JSON.generate({ id: item_id })
      )
    }
  }

  it 'initializes an item given an id and data' do
    item = Cloth::Item.new(item_id, {})
    expect(item.id).to eq(item_id)
    expect(item.data).to eq({})
  end

  context 'with an item' do
    let(:item) {
      Cloth::Item.new(item_id, { user_id: SecureRandom.uuid })
    }

    describe :recommend do
      it 'can recommend an item (instance)' do
        resp = item.recommend
        expect(resp["id"]).to eq(item_id)
      end

      it 'can recommend an item (class)' do
        resp = Cloth::Item.recommend(item_id)
        expect(resp["id"]).to eq(item_id)
      end
    end

    describe :unrecommend do
      it 'can unrecommend an item (instance)' do
        resp = item.unrecommend
        expect(resp["id"]).to eq(item_id)
      end

      it 'can unrecommend an item (class)' do
        resp = Cloth::Item.unrecommend(item_id)
        expect(resp["id"]).to eq(item_id)
      end
    end

    describe :recommendations do
      it 'can get recommendations based on an item (instance)' do
        resp = item.recommendations
        expect(resp['items'].count).to eq(rec_count)
      end

      it 'can get recommendations based on an item (class)' do
        resp = Cloth::Item.recommendations(item_id)
        expect(resp['items'].count).to eq(rec_count)
      end
    end
  end
end
