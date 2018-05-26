class UsersController < ApplicationController

  include UsersHelper

  before_action :logged_in_user, only: [:timeline]

  def index
    @users = User.all
  end

  def timeline
    @post    = Post.new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.js
    end

  end

  def friends

   @user = User.find(params[:id])
   @friends = @user.friends

   respond_to do |format|
     format.html
     format.js
   end

  end

  def friends_requests
    @friends_requests = current_user.friendship_requests
  end

  def serach

    if params[:q].blank?
      redirect_back fallback_location: root_path
    else
      @users = User.search(params[:q])

      respond_to do |format|
        format.html { render "users/index" }
        format.js   
      end
    end

  end

  private

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
