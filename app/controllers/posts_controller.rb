class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def show
    @post = Post.find(find_params)
  end

  private

  def find_params
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
