class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    redirect_to item_path(params[:item_id])
    # respond_to do |format|
    #   format.html { redirect_to item_path(params[:item_id])  }
    #   format.json
    # end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to "/items/#{review.item_id}"

  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :image, :delicious, :eazy, :cost).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
