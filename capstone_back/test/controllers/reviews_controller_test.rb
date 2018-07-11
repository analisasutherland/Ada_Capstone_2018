require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  let(:review) { reviews :one }

  it 'shows review' do
    get review_url(review)
    value(response).must_be :success?
  end
end
