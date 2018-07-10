require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  let(:review) { reviews :one }

  it "gets index" do
    get reviews_url
    value(response).must_be :success?
  end

  it "creates review" do
    expect {
      post reviews_url, params: { review: { content: review.content, title: review.title } }
    }.must_change "Review.count"

    value(response.status).must_equal 201
  end

  it "shows review" do
    get review_url(review)
    value(response).must_be :success?
  end

  it "updates review" do
    patch review_url(review), params: { review: { content: review.content, title: review.title } }
    value(response.status).must_equal 200
  end

  it "destroys review" do
    expect {
      delete review_url(review)
    }.must_change "Review.count", -1

    value(response.status).must_equal 204
  end
end
