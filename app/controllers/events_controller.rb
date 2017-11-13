class EventsController < ApplicationController
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

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
