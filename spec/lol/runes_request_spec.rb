require "spec_helper"
require "lol"

describe Lol::RunesRequest do
  subject { Lol::RunesRequest.new "api_key", "euw" }

  describe "#by_summoner_id" do
    it "returns an Array of DynamicModel" do
      stub_request subject, "runes", "runes/by-summoner/1"
      result = subject.by_summoner_id 1
      expect(result).to be_a Array
      expect(result.map(&:class).uniq).to eq [Lol::DynamicModel]
    end
  end
end
