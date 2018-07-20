require 'pry'
class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: %i[show update destroy]

  # GET /recommendations
  def index
    @recommendations = Recommendation.all

    render :json => @recommendations, :include => {:game => {:only => [:game_title, :image]}}, :except => [:created_at, :updated_at]
  end

  # GET /recommendations/1
  def show
    render json: @recommendation
  end

  # POST /recommendations
  def create
    filtered_games = Game.find_by_tags(params[:selected_tags])

    filtered_games.each do |id|
      puts 'Creating Recommendation for Topics'

      logger.debug "Game: #{id}"
      test_hash = {
        game_id: id
      }

      puts test_hash

      @recommendation = Recommendation.new(test_hash)
      puts @recommendation
    end
    if @recommendation.save
      logger.debug "saved"
      # render json: @recommendation, status: :ok
      render :json => @recommendation, :include => { :game => { :except => [:created_at, :updated_at] } }
    else
      render status: :bad_request, json: { errors: @recommendation.errors.message }
    end
  end

  # PATCH/PUT /recommendations/1
  def update
    if @recommendation.update(recommendation_params)
      render json: @recommendation
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recommendations/1
  def destroy
    @recommendation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recommendation_params
    params.require(:recommendation).permit(selected_tags)
  end
end
