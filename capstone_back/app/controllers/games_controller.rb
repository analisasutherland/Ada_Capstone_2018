class GamesController < ApplicationController
  before_action :set_game, only: %i[show update]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # # POST /games
  # def create
  #   @game = Game.new(game_params)
  #
  #   if @game.save
  #     render json: @game, status: :created, location: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /games/1
  # def update
  #   if @game.update(game_params)
  #     render json: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:game_title, :image)
  end
end
