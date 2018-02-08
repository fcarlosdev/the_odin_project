class PostsController < ApplicationController

  before_action :signed_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      flash[:success] = "Post created!!!"
      redirect_to posts_path
    else
      flash[:danger] = "Error during creation of the post."
      render new_post_path
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body)
  end

end
