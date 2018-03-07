class EventsController < ApplicationController

  before_action :user_logged, only: [:new, :create, :show, :index]
  before_action :allow_to_visualize, only: [:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    if @event.save
      flash[:success] = "Event sucessfully created!"
      redirect_to current_user
    else
      puts "ENDED HERE.........."
      # flash[:danger] = "Event doesn't created"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees_confirmed = attendees_confirmed(@event)
    @invites_not_accepted = attendees_not_confirmed(@event)
  end

  private

    def attendees_confirmed(event)
      invites_from(event, :true).map {|invite| invite.guest(invite.attendee_id)}
    end

    def attendees_not_confirmed(event)
      invites_from(event, false).map {|invite| invite.guest(invite.attendee_id)}
    end

    def invites_from(event,accepted)
      event.invites(accepted)
    end

    def event_params
      params.require(:event).permit(:title, :at_date, :description)
    end

    def user_logged
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def allow_to_visualize
      event = Event.find(params[:id])
      invited = event.invitations.any?{|invite| invite.attended_event_id = event.id}
      if (event.creator.name != current_user.name && !invited)
        flash[:danger] = "You not was invited to this event."
        redirect_to events_path
      end
    end

end
