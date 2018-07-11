require "test_helper"

describe Game do
  let(:game) { Game.new }

  it "must be valid" do
    value(game).must_be :valid?
  end
end
