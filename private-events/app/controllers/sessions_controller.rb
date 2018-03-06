class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)
    if @user
      log_in(@user)
      if @user.invitations.any? {|invite| invite.accepted == false }
        redirect_to @user
      else
        redirect_to root_path
      end
    else
     flash.now[:error] = "User '#{params[:session][:name]}' not found."
     render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end

end
