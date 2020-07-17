class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
    @review.review_images.new
  end

  def create
    @review = Review.new(review_params)
    if @post.save

      redirect_to root_path
    else
      alert '登録できません'
      redirect_to new_post_path
    end
  end

  def show
    
  end

  

  private

  def review_params
    params.require(:review).permit(:title, :content, :item_id, review_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
