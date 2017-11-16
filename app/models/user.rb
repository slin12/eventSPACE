class User < ApplicationRecord

  has_many :messages
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id"
  has_many :rsvps
  has_many :events, through: :rsvps

  has_secure_password

  mount_uploader :profile, ProfileUploader

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: { in: 4..32 }


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

  def pending_friend_requests
    friendships = Friendship.all.where(friend_id: self.id)
    requests = []
    friendships.each do |friendship|
      requests << User.find(friendship.user_id)
    end
    requests - self.accepted_friends
  end

  def self.search(search)
    if search
      # User.where(["name LIKE ?", "%#{search}%"])
      User.all.select {|user| user.name.downcase.include?(search.downcase)}
    else
      nil
    end
  end

  def events_going
    rsvps = self.rsvps.select {|x| x.attending == "yes"}
    rsvps.map {|rsvp| rsvp.event}.sort_by {|x| x.date}
  end

end
