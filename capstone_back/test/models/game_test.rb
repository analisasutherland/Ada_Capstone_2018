require "test_helper"

describe Game do
  it 'can be created' do
    test_game = Game.new('game_title': 'Anthem')
    assert test_game.valid?
  end
end
# TODO: Association Tests for Rec and Games
