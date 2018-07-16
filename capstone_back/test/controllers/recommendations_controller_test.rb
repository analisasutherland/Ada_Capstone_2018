require 'test_helper'

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  let(:recommendation) { recommendations :one }
  describe 'Create method' do
    it 'creates a recommendation' do
      params = {
        selected_tags: [
          'adventure'
        ]
      }
      post recommendations_url(params)
      rec = Recommendation.last

      assert_response :ok
    end
  end
  # it "gets index" do
  #   get recommendations_url
  #   value(response).must_be :success?
  # end
  #
  # it "creates recommendation" do
  #   expect {
  #     post recommendations_url, params: { recommendation: { game_id: recommendation.game_id, score: recommendation.score, user_id: recommendation.user_id } }
  #   }.must_change "Recommendation.count"
  #
  #   value(response.status).must_equal 201
  # end
  #
  # it "shows recommendation" do
  #   get recommendation_url(recommendation)
  #   value(response).must_be :success?
  # end
  #
  # it "updates recommendation" do
  #   patch recommendation_url(recommendation), params: { recommendation: { game_id: recommendation.game_id, score: recommendation.score, user_id: recommendation.user_id } }
  #   value(response.status).must_equal 200
  # end
  #
  # it "destroys recommendation" do
  #   expect {
  #     delete recommendation_url(recommendation)
  #   }.must_change "Recommendation.count", -1
  #
  #   value(response.status).must_equal 204
  # end
end
