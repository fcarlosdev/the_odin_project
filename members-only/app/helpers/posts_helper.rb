module PostsHelper

  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please sign in"
      redirect_to signin_path
    end
  end

end
