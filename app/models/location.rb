class Location < ApplicationRecord
  has_many :events
  @@cache = []

  def self.cache
    @@cache
  end

  def self.name_from_submit(select)
    select.gsub("Select ", "")
  end
end
