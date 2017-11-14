class Event < ApplicationRecord
  has_many :messages
  belongs_to :location
  has_many :rsvps
  has_many :users, through: :rsvps
  belongs_to :host, class_name: 'User'

  validates :title, :date, :time, presence: true

  def real_time
    date = self.date
    date.strftime("%A, %m/%d/%Y")
  end

  def real_location
    loc = self.location
    "#{loc.address1} " +
    "#{loc.address2} " +
    "#{loc.city_state} #{loc.zip}"
  end

  def url_helper
    address = self.location.real_location
    self.location.name.split(" ").join("+") + address.split(/[ ,]+/ ).join("+")
  end

  def is_private?
    if self.admittance == true
      "Public"
    else
      "Private"
    end
  end

  def private=(arg)
    if arg == "on"
      self.admittance = false
    end
  end

  def going
    Rsvp.where("event_id = ?", self.id).select {|x| x.attending == "yes"}
  end

  def invited
    Rsvp.where("event_id = ?", self.id).select {|x| x.attending == "maybe"}
  end

  def not_going
    Rsvp.where("event_id = ?", self.id).select {|x| x.attending == "no"}
  end

  def self.public_events
    Event.where("admittance = ?", true)
  end

end
