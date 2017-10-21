require "spec_helper"

RSpec.describe Cloth::Client do
  let(:instance) { Cloth::Client.new }

  describe :request do
    it 'generate a request w/ an api url prefixed' do
      request = instance.request(:get, "/items/4")
      expect(request.url).to eq('https://api.cloth.network/items/4')
    end

    it 'generate a request w/ headers' do
      request = instance.request(:get, "/items/4")
      headers = request.options[:headers]
      expect(headers[:"Content-Type"]).to eq("application/json")
      expect(headers[:"Cloth-Api-Key"]).to eq("1234")
    end
  end

  describe :get do
    let(:body) { { 'foo': 'bar' } }
    let(:url) { "https://api.cloth.network/items/4" }
    let(:resp) { Typhoeus::Response.new(body: body.to_json) }

    before do
      Typhoeus.stub(url).and_return(resp)
    end

    it 'can get a url and parse it to json' do
      resp = Cloth::Client.get("/items/4")
      expect(resp["foo"]).to eq(body[:foo])
    end
  end

  describe :post do
    let(:body) { { 'foo': 'bar' } }
    let(:url) { "https://api.cloth.network/items/4" }
    let(:resp) { Typhoeus::Response.new(body: body.to_json) }

    before do
      Typhoeus.stub(url).and_return(resp)
    end

    it 'can post to a url with a body' do
      resp = Cloth::Client.post("/items/4", body)
      expect(resp["foo"]).to eq(body[:foo])
    end
  end
end
