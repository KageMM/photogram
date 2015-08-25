class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

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
    @post = Post.find(find_post)
  end

  def edit
    @post = Post.find(find_post)
  end

  def update
    @post = Post.find(find_post)

    if @post.update(post_params)
      redirect_to @post, notice: "Post was Successfully updated!!"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(find_post)
    @post = Post.destroy
    redirect_to root_path
  end

  private

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
