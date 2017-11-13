class Event < ApplicationRecord
  has_many :messages
  belongs_to :location
  has_many :rsvps
  has_many :users, through: :rsvps
end
