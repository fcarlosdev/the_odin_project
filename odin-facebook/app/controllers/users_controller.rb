class UsersController < ApplicationController

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
   @friendships = (current_user.friendships + current_user.inverse_friendships).uniq

   respond_to do |format|
     format.html
     format.js
   end

  end

  def friends_requests
    @friends_requests = current_user.inverse_friendships
  end

  private

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
