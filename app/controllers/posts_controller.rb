class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if logged_in?
      user = User.find_by(id: session[:user_id])
      post = user.posts.create(post_params)
      redirect_to root_path
    else
      redirect_to sessions_new_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :url)
  end


end
