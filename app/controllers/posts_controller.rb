class PostsController < ApplicationController
  def index
    @posts = Post.includes(:post_images).order('created_at DESC')
  end

  def new
    @post = Post.new
    @post.post_images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save

      redirect_to root_path
    else
      alert '登録できません'
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :review, :price, :prefecture, post_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
