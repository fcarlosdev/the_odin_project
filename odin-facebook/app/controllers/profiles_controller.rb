class ProfilesController < ApplicationController

  def show
    @post = Post.new
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    puts "PARAMS => #{params.inspect}"
    @profile = current_user.profile
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render "edit"
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:picture, :birthday, :country, :education,
           :profession, :about_me, :email_notification)
    end
end
