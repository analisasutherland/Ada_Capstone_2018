require "test_helper"

describe Game do
  before do
    @game = games(:anthem)
  end

  describe 'Constructor' do
    it 'can be created' do
      assert @game.valid?
    end
  end
  describe 'relations' do
    it 'has Reviews' do
      @game.must_respond_to :reviews
    end

    it 'has Recommendations' do
      @game.must_respond_to :recommendations
    end
  end
end
# TODO: Tests for class method find_by_tags
