class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]

  # GET /reviews/1
  def show
    render json: @review.as_json(
      only: %i[title content]
    )
  end

  private

  # TODO: Ask Charles what these methods are doing, they were automatically created upon generation of Rails API
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def review_params
    params.require(:review).permit(:title, :content)
  end
end
