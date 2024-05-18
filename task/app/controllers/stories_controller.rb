class StoriesController < ApplicationController

  def index
    stories = Story.where(user_id: params[:user_id]).page(params[:page]).per(5)
    render json: stories
  end

  def create
    user = User.find(params[:user_id])
    story = user.stories.create!(story_params)
    if story.save
      render json: story, status: :created
    else
      render json: { errors: story.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def top_stories
    stories = Story.joins(:reviews)
                    .select('stories.*, AVG(reviews.rating) as avg_rating')
                    .group('stories.id')
                    .order('avg_rating DESC')
                    .page(params[:page])
    render json: stories
  end

  private

  def story_params
    params.require(:story).permit(:title, :body, :user_id)
  end

end
