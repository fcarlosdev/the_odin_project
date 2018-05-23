class RegistrationsController < Devise::RegistrationsController
  def create
    super
    send_welcome_signup(@user) unless @user.invalid?
  end
end
