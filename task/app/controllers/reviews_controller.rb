class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params.merge(params.permit(:story_id)))
    if review.save
      render json: review, status: :created
    else
      render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id)
  end

end
