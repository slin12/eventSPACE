class FriendshipsController < ApplicationController
  def create
    Friendship.where(user_id: session[:user_id], friend_id: friendship_params["user_id"]).first_or_create
    flash[:notice] = "Friend request sent."
    redirect_to user_path(friendship_params["user_id"])
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id)
  end
end
