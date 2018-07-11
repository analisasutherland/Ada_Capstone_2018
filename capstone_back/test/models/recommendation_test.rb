require "test_helper"

describe Recommendation do
  let(:recommendation) { Recommendation.new }

  it 'Can be created' do
    test_recommendation = Recommendation.new('score': 0, 'game_id': 1, 'user_id': 2)
    assert test_recommendation.valid?
  end

  it 'is invalid without a game_id' do
    test_recommendation = Recommendation.new('score':0,'user_id':2)
    assert_not_nil recommendation.errors[:game_id], 'no validation error for game_id present'
  end
end
