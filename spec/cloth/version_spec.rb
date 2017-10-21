require "spec_helper"

RSpec.describe "Cloth version" do
  it "has a version number" do
    expect(Cloth::VERSION).not_to be nil
  end
end
