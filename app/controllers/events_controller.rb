class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @location = Location.first
    @event = Event.new(location: @location)
  end

  def create
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
