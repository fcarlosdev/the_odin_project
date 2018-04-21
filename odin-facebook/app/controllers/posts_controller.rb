class PostsController < ApplicationController

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to newsfeed_path
    else
      flash[:error] = "Invalid post"
      # redirect_to newsfeed_path(current_user)
      redirect_to newsfeed_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:content, current_user)
    end

end
