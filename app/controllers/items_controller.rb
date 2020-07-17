class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def create
    @item = Item.find_or_initialize_by(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      redirect_to item_search_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], genreId: 100227 )
    end
  end

  private

  def item_params
    params.permit(:name, :discription, :price, :imageurl, :itemurl).merge(user_id: current_user.id)
  end
end
