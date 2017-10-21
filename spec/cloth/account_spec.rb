require "spec_helper"

RSpec.describe Cloth::Account do
  before {
    Cloth.client.stub(:get) {
      JSON.parse(
        JSON.generate(
          used: 0,
          total: 100
        )
      )
    }
  }

  describe :usage do
    it 'can get usage limits for an account' do
      resp = Cloth::Account.usage
      expect(resp['used']).to eq(0)
    end
  end
end
