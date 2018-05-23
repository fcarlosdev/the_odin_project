class Users::OmniauthCallbacksController <  Devise::OmniauthCallbacksController
  def facebook
    new_user = User.new_user?(request.env["omniauth.auth"].info.email)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      send_welcome_signup(@user) if new_user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
