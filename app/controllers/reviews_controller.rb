class ReviewsController < ApplicationController
  before_action :find_bike
  before_action :find_review, only: [:destroy]

  def create
    if already_reviewed?
      flash[:notice] = "You can't review more than once"
    else
      @bike = Bike.find(params[:bike_id])
      @review = Review.new(review_params)
      @review.bike = @bike
      @review.user = current_user
      if @review.save
        redirect_to bike_path(@bike, anchor: "review-#{@review.id}")
      else
        flash[:alert] = "Something went wrong."
        render "bikes/show"
      end
    end
  end

  def destroy
    if !already_reviewed?
      flash[:notice] = "Cannot unreview"
    else
      @review.destroy
    end
    redirect_to bike_path(@bike)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_bike
    @bike = Bike.find(params[:bike_id])
  end

  def find_review
    @review = @bike.reviews.find(params[:id])
  end

  def already_reviewed?
    Review.where(user_id: current_user.id, bike_id:
      params[:bike_id]).exists?
  end
end
