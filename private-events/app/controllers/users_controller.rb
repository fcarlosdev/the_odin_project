class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="user #{@user.name} registered!!!"
      redirect_to @user
    else
     render 'new'
    end
  end

  def show
    if signed_in?
      @user = User.find(params[:id])
      @events = @user.created_events
      @past_events = @events.previous_events
      @future_events = @events.upcoming_events
      @invites = []
      @user.invitations.each do |invite|
        @invites << Event.find(invite.attended_event_id)
      end
    else
      redirect_to login_path
    end
  end

  def new_invite
    @people_to_invite = list_people_to_invite
  end

  def create_invite
    people_ids = params[:people_invited]
    if people_ids.any?
      people_ids.each do |id|
        person_invited   = User.find(id)
        invited_to_event = Event.find(params[:event_id])
        @event = invited_to_event
        person_invited.attended_events << invited_to_event
      end
      flash[:success] = "All invitations ok."
      redirect_to @event
    end
  end

  def list_people_to_invite
    User.where("name != :actual_user_name", {actual_user_name: current_user.name})
  end

  def accept_invite
    e = current_user.invitations.find_by(attendee_id: current_user.id)
    if e.update(accepted: params[:accepted])
      flash[:success] = "Invite accepted."
      redirect_to current_user
    else
      flash[:danger] = "Error to the accept."
      render current_user
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :accepted)
    end

end
