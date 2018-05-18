module ApplicationHelper

  def avatar_for(user,size=48)
    if user.profile.picture.present?
      user.profile.picture.url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?&s=#{size}&d=mp"
    end
  end

end
