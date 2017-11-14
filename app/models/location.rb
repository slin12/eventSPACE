class Location < ApplicationRecord
  has_many :events

  @@cache = []

  def self.cache
    @@cache
  end

  def self.name_from_submit(select)
    select[7..-1]
  end

  def real_location
    "#{self.address1}" +
    "#{self.address2} " +
    "#{self.city_state} #{self.zip}"
  end

end
