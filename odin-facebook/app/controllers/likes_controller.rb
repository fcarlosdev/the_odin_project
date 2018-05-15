class LikesController < ApplicationController

  include LikesHelper

  def create
    like = current_user.likes.create(post_id: params[:post_id])
    if like.save!
      redirect_to timeline_path(current_user)
    else
      redirect_to timeline_path(current_user)
    end
  end

  def destroy
    get_like_to(params[:post_id],current_user.id).destroy
    redirect_to timeline_path(current_user)
  end

end
