class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)
    if @user
      log_in(@user)
      redirect_after_login
    else
     flash.now[:danger] = show_error_login
     render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def show_error_login
    params[:session][:name].empty? ? "User name not provided" :
                                  "User '#{params[:session][:name]}' not found."
  end

  def redirect_after_login
    has_invitations? ? (redirect_to @user) : (redirect_to root_path)
  end

  def has_invitations?
    @user.invitations.any? {|invite| invite.accepted == false}
  end

end
