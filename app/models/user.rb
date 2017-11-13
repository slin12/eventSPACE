class User < ApplicationRecord
  has_many :messages
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id"
  has_secure_password
  has_many :rsvps
  has_many :events, through: :rsvps
end
