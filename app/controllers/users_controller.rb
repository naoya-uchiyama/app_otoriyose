class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC").page(params[:page]).per(5)
    @reviews = @user.reviews.order("created_at DESC").page(params[:page]).per(5)
  end

end