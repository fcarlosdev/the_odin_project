class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
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
           :profiession, :about_me, :email_notification)
    end
end
