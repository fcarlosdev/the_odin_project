class PostsController < ApplicationController

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to timeline_path(current_user)
    else
      flash[:alert] = "Invalid post"
      redirect_to timeline_path(current_user)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if (@post.user_id == current_user.id)
      @post.destroy
    else
      @post.visible = false
      @post.save
    end
    redirect_to timeline_path(current_user)
  end


  private

    def post_params
      params.require(:post).permit(:content, current_user)
    end

end
