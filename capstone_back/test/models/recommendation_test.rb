require "test_helper"

describe Recommendation do
  let(:recommendation) { Recommendation.new }

  it "must be valid" do
    value(recommendation).must_be :valid?
  end
end
