module UsersHelper

  def friend_requests_pending
    current_user.inverse_friendships.select{|f| f.accepted == false}.length
  end

end
