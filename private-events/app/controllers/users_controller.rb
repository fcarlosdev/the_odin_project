class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name.downcase!
    if @user.save
      log_in(@user)
      flash[:success]="user #{@user.name} registered!!!"
      redirect_to root_url
    else
     render 'new'
    end
  end

  def show
    if logged_in?
      @events = current_user.created_events
      @past_events = @events.previous_events
      @future_events = @events.upcoming_events
      @invites = get_invitations || []
    else
      redirect_to login_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.invitations.each do |invite|
      invite.delete
    end
    user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def new_invite
    @people_to_invite = users_not_invited
  end

  def create_invite
    people_ids = params[:people_invited]
    if !people_ids.nil? && people_ids.any?
      people_ids.each do |id|
        person_invited   = User.find(id)
        invited_to_event = Event.find(params[:event_id])
        @event = invited_to_event
        person_invited.attended_events << invited_to_event
      end
      flash[:success] = "All invitations sending with sucess!!!"
      redirect_to @event
    end
  end

  def accept_invite
    invite = current_user.invitations.find_by(attended_event_id: params[:event])
    if invite.update_column(:accepted, params[:accepted])
      flash[:success] = "Invite accepted."
      invite.save
      redirect_to current_user
    else
      flash[:danger] = "Error to the accept."
      render current_user
    end
  end

  private

    def users_not_invited
      invites = invitations_to(params[:obj][:event_id])
      users_to_invite.select{|user| invites.all?{|invite|
                                invite.attendee_id != user.id}}
    end

    def invitations_to(event)
      Invitation.select("attendee_id").
        where("attended_event_id = :event", {event: event})
    end

    def users_to_invite
      index - [current_user]
    end

    def get_invitations
      current_user.invitations.map {|invite| Event.find(invite.attended_event_id) if invite.accepted == false}.compact
    end

    def user_params
      params.require(:user).permit(:name, :accepted)
    end

end
