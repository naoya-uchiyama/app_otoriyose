class UsersController < ApplicationController
  before_action :move_to_root

  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC").page(params[:page]).per(5)
    @reviews = @user.reviews.order("created_at DESC").page(params[:page]).per(5)
  end


  private

  def move_to_root
    @user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @user.id
  end
end