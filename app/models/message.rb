class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :content, presence: true

  def format_time
    self.created_at.strftime("%B %d, %Y %l:%M %p")
  end
end
