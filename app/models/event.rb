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

end
