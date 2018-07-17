require "test_helper"
describe Recommendation do
  before do
    @recommendation = recommendations(:new_rec)
  end

  describe 'Constructor' do
    it 'can be created' do
      assert @recommendation.valid?
    end

    it 'has a game' do
      @recommendation.must_respond_to :game
    end

    it 'cannot be created without a game' do
      bad_rec = recommendations(:new_rec_2)
      bad_rec.valid?.must_equal false
      bad_rec.errors.messages.must_include :game
    end
  end
end
