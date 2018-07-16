require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  before do
    @review = reviews(:one)
  end

  describe 'Constructor' do
    it 'Can be created' do
      assert @review.valid?
    end
  end

  describe 'Relations' do
    it 'has Games' do
      @review.must_respond_to :game
    end

    it 'has Tags' do
      @review.must_respond_to :tags
    end
  end
end
