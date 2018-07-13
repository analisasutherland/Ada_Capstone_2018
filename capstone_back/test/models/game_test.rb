require "test_helper"

describe Game do
  let (:game_data) {
    {
      "game_title": "Anthem"
    }
  }

  before do
    @game = Game.new(game_data)
  end

  describe 'Constructor' do
    it 'can be created' do
      test_game = Game.new(game_data)
      assert test_game.valid?
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
