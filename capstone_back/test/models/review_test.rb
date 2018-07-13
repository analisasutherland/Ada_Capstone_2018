require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  let (:review_data) {
    {
      "title": "Awesome Game",
      "content": "Review Stuff",
    }
  }

  before do
    @review = Review.new(review_data)
  end

  describe 'Constructor' do
    it "Can be created" do
      assert @review.valid?
    end
  end

  describe "Relations" do
    it "has Games" do
      @review.must_respond_to :games
    end

    it 'can set the game through Game' do
      test_game = Game.create!(game_title:"Another Game")
      test_review = Review.new(review_data)

      test_review.game = test_game

      test_review.game_id.must_equal test_game.id
    end

    it 'can set the game through game_id' do
      test_game = Game.create!(game_title:"Another Game")
      test_review = Review.new(review_data)

      test_review.game_id = test_game.id

      test_review.game.must_equal test_game
    end
  end
end
