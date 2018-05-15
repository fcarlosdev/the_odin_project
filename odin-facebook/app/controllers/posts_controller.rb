class PostsController < ApplicationController

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to timeline_path(current_user)
    else
      flash[:error] = "Invalid post"
      redirect_to timeline_path(current_user)
    end
  end

  def update
    @post = Post.find(params[:id])

  end


  private

    def post_params
      params.require(:post).permit(:content, current_user)
    end

end
