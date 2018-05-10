class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friendship requested!!!"
      redirect_to users_path
    else
      flash[:error] = "Unable to add friend request."
      redirect_to users_path
    end
  end

  def destroy
    Friendship.find(params[:id]).destroy
    flash[:error] = "Removed friendship."
    redirect_to friends_path(current_user)
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.accepted = true
    @friendship.save    
    redirect_to friends_requests_path(current_user)
  end

end
