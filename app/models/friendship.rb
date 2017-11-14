class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  # def self.friend_list(user)
  #   user.friends.uniq.map do |friend|
  #     #beef << friend if friend.friend?(user)
  #     #byebug
  #   end
  #   #beef
  # end
end
