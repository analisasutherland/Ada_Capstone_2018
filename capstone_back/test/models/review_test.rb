require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  before do
    @review = reviews(:one)
  end

  describe 'Constructor' do
    it "Can be created" do
      assert @review.valid?
    end
  end

  describe "Relations" do
    it "has Games" do
      @review.must_respond_to :game
    end

    it 'can set the game through Game' do
      test_game = games(:anthem)

      @review.game = test_game

      @review.game_id.must_equal test_game.id
    end

    it 'can set the game through game_id' do
      test_game = games(:anthem)

      @review.game_id = test_game.id

      @review.game.must_equal test_game
    end
  end
end
