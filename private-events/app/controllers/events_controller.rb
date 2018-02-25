class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    if @event.save!
      redirect_to current_user, notice: "Event sucessfully created!"
    else
      flash[:danger] = "Event doesn't created"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    # @attendees = @event.attendees
  end


  private

    def event_params
      params.require(:event).permit(:title, :at_date, :description)
    end

end
