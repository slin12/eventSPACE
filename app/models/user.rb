class User < ApplicationRecord
  has_many :messages
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id"
  has_many :rsvps
  has_many :events, through: :rsvps
  has_secure_password

  def friend?(current_user)
    !! Friendship.all.find_by(user_id: self.id, friend_id: current_user.id)
  end

  def invited_events
    self.rsvps.select {|x| x.attending == "maybe"}
  end

  def accepted_friends
    self.friends.select do |friend|
      friend.friends.include?(self)
    end
  end

  def self.search(search)
    if search
      User.where(["name LIKE ?", "%#{search}%"])
    else
      nil
    end
  end


end
