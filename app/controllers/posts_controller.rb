class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
    flash[:success] = "Your post has been created!"
    redirect_to root_path
    else
    flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
    render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post has been updated!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your new post couldn't be updated!  Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
