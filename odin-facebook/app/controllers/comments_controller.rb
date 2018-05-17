class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save!
      redirect_to timeline_path(current_user)
    else
      redirect_to timeline_path(current_user)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :post_id, current_user.id)
    end

end
