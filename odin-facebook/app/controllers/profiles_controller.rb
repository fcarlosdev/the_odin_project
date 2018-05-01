class ProfilesController < ApplicationController
  def show
    # @profile = Profile.find(params[:id])
    @profile = Profile.new
    @profile.user = current_user
  end

  def edit
    @profile = Profile.new
    @profile.user = current_user
    @profile = current_user.profile
  end

  def update
  end
end
