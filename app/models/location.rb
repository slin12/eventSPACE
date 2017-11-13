class Location < ApplicationRecord
  has_many :events
  @@cache = []

  def self.cache
    @@cache
  end
end
