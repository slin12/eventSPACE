class UsersController < ApplicationController
  helper_method :friend_status


  # def index
  # end

  def show
    @user = User.find(params[:id])
    @friendship = Friendship.new
    @friend_status = friend_status(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're logged in!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Your sign up information is invalid, please try again."
      render new_user_path
    end
  end

  # Mispelling
  def dashbaord
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def users_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :birthday, :bio)
  end

  def friend_status(user)
    if user == current_user
      @friend_status = ""
    elsif user.friend?(current_user) && current_user.friend?(user)
      @friend_status = "Friends"
    elsif current_user.friend?(user)
      @friend_status = "Request Sent"
    elsif user.friend?(current_user)
      @friend_status = "Accept Request"
    else
      @friend_status = "Add Friend"
    end
  end

end
