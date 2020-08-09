class ReviewsController < ApplicationController

  def new
    @item = RakutenWebService::Ichiba::Item.search(itemCode: params[:itemcode]).first
    @@itemcode = params[:itemcode]
    @review = Review.new
    @reviews = Review.includes(:user).order("created_at DESC")
  end

  def create
    @review = Review.create(review_params)
    redirect_to reviews_list_path
    # redirect_to review_path(params[:id])
    # respond_to do |format|
    #   format.html { redirect_to item_path(params[:item_id])  }
    #   format.json
    # end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_list_path
  end

  def list
    @item = RakutenWebService::Ichiba::Item.search(itemCode: @@itemcode).first
    @reviews = Review.where(itemcode: @@itemcode).order("created_at DESC").page(params[:page]).per(5)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :image, :delicious, :eazy, :cost, :itemcode).merge(user_id: current_user.id)
  end
end
