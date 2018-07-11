require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  it "Can be created" do
    review = Review.new("title": "Awesome Game",
      "content": "Review Stuff")
      assert review.valid?
    end

    it "Invalid without a title" do
      review = Review.new("content": "Review Stuff")
      refute review.valid?, 'review is valid without a title'
      assert_not_nil review.errors[:title], 'no validation error for title present'
    end

    it 'Invalid without content' do
      review = Review.new('title': "Awesome Game")
      refute review.valid?, 'review is not valid without content'
      assert_not_nil review.errors[:content], 'No validation error for content present'
    end
  end
