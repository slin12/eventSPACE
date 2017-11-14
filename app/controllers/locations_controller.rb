class LocationsController < ApplicationController
  before_action :authorize_user, only: [:new]

  def index
  end

  def show
  end

  def search
    locations = Yelp.search(params[:type], params[:location])["businesses"]
    @array = locations.map do |location|
      l = Location.new(name: location["name"], address1: location["location"]["address1"], address2: location["location"]["address2"], city_state: "#{location['location']['city']}, #{location['location']['state']}", zip: location["location"]["zip_code"], phone: location["display_phone"])
      Location.cache << l
      l
    end
    render 'results'
  end

  def new
  end

  def create
    name = Location.name_from_submit(params["commit"])
    location = Location.cache.find {|x| x.name == name}
    if Location.find_by(name: location.name, zip: location.zip)
      @location = Location.find_by(name: location.name, zip: location.zip)
    else
      @location = Location.cache.find {|x| x.name == name}
      @location.save
    end
    Location.cache.clear
    @event = Event.new
    render 'events/new'
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
