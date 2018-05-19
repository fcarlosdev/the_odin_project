class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_path }
        format.js {redirect_to users_path }
      else
        format.html { redirect_to users_path, notice: "Unable to
          add friend request."}
      end
    end
  end

  def destroy
    if (!params[:user].nil?)
      @user = User.find(params[:user])
      @friends = @user.friends
    else
      @user = current_user
      @friends = @user.friends
    end
    Friendship.find(params[:id]).destroy

    respond_to do |format|
      if (params[:origin] == "friends_details")
        format.html { redirect_to friends_path(@user) }
        format.js {render layout: false}
      elsif (params[:origin] == "user_list")
        format.html { redirect_to users_path }
        format.js { redirect_to users_path }
      end
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.accepted = true
    @friendship.save

    respond_to do |format|
      if params[:origin] == 'requests'
        format.html { redirect_to friends_requests_path(current_user) }
        format.js {render layout: false}
      elsif params[:origin] == 'user_list'
        format.html { redirect_to users_path }
        format.js { redirect_to users_path }
      elsif params[:origin] == 'friends_details'
        format.html { redirect_to friends_path(current_user) }
        format.js { redirect_to friends_path(current_user) }
      end

    end
  end

end
