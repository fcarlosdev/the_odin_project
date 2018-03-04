class StaticPagesController < ApplicationController
  def index
    if signed_in?
      @events = Event.all
      redirect_to events_path
    end
  end
end
