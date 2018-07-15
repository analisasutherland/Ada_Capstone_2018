# FIXME: Tests are not working for many to many relationship between tag and reviews
require "test_helper"

describe Tag do
  before do
    @tag = tags(:adventure)
  end

  describe 'Constructor' do
    it 'can be created' do
      assert @tag.valid?
    end
  end

  describe 'Relations'do
    it 'has Reviews' do
      @tag.must_respond_to :review
    end

    it 'can set the review through Review' do
      test_review = reviews(:one)

      @tag.review = test_review

      @tag.reviews_id.must_equal test_review.id
    end

    it 'can set the review through review_id' do
      test_review = reviews(:one)

      @tag.review_id = test_review.id

      @tag.review.must_equal test_review
    end
  end
end
