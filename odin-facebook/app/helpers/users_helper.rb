module UsersHelper

  def friend_requests_pending
    current_user.inverse_friendships.select{|f| f.accepted == false}.length
  end

  def get_friend_at(friendship)
    friendship.friend || friendship.user
  end

  def exists_friendship?(user1, user2)
    user1.friends.include?(user2) || user2.friends.include?(user1)
  end

  def find_friendship(user1, user2)
    user1.friendships.find_by(friend_id: user2.id, accepted: true) ||
    user2.friendships.find_by(friend_id: user1.id, accepted: true)
  end

end
