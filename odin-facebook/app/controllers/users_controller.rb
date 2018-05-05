class UsersController < ApplicationController

  before_action :logged_in_user, only: [:newsfeed]

  def index
    @users = User.all
  end

  def newsfeed
    @post    = Post.new
    @comment = Comment.new
  end

  private

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
