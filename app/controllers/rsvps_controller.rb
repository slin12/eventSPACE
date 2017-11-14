class RsvpsController < ApplicationController
  def create
    event = Event.find(rsvp_params["event_id"])
    rsvp = event.rsvps.find {|x| x.user_id == session[:user_id]}
    if rsvp_params["commit"] == "Yes"
      rsvp.attending = "yes"
      rsvp.save
      redirect_to request.referrer
    else
      rsvp.attending = "no"
      rsvp.save
      redirect_to request.referrer
    end
  end

  private
  def rsvp_params
    params.permit(:event_id, :commit)
  end
end
