class EventsController < ApplicationController
  before_action :authorize_user, only: [:create]

  def index
    if params[:zip]
      @events = Event.all.select do |event|
        (event.location.zip == params[:zip].to_i)
      end
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @location = Location.find(event_params["location_id"])
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      flash[:notice] = "You've successfully created an event!"
      Rsvp.create(event_id: @event.id, user_id: current_user.id, attending: "yes")

      params["event"]["user_ids"].each do |user_id|
        Rsvp.create(event_id: @event.id, user_id: user_id, attending: "maybe")
      end

      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:location_id, :title, :date, :time, :private)
  end
end
