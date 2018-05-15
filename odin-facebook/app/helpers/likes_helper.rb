module LikesHelper

  def post_liked?(post)
    !current_user.likes.find_by(post_id: post).nil?
  end

  def get_like_to(post,by_user)
    Post.find(post).likes.find_by(user_id: by_user)
  end

end
