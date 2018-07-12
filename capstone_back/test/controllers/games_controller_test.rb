require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  let(:game) { games :one }

  # it "gets index" do
  #   get games_url
  #   value(response).must_be :success?
  # end
  #
  # it "creates game" do
  #   expect {
  #     post games_url, params: { game: { game_title: game.game_title } }
  #   }.must_change "Game.count"
  #
  #   value(response.status).must_equal 201
  # end
  #
  # it "shows game" do
  #   get game_url(game)
  #   value(response).must_be :success?
  # end
  #
  # it "updates game" do
  #   patch game_url(game), params: { game: { game_title: game.game_title } }
  #   value(response.status).must_equal 200
  # end
  #
  # it "destroys game" do
  #   expect {
  #     delete game_url(game)
  #   }.must_change "Game.count", -1
  #
  #   value(response.status).must_equal 204
  # end
end
