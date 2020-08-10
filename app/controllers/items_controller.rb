class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @reviews = Review.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    @item = Item.find_or_create_by(item_params)
  end

  def show
    @search_item = RakutenWebService::Ichiba::Item.search(itemCode: @item.itemcode).first
    @reviews = Review.includes(:user).where(itemcode: @item.itemcode)
  end

  def search
    if params[:keyword].present?
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], genreId: 100227 )
    end
  end

  def destroy
    @item.destroy
    redirect_to "/users/#{@item.user_id}"
  end

  private

  def item_params
    params.permit(:itemcode).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
