class UsersController < ApplicationController
  before_action :authorize_user, only: [:dashboard, :edit]
  helper_method :friend_status
  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to root_path
  #   end
  # end
  def index
    @users = User.search(params[:search])
  end
  def show
    @user = User.find(params[:id])
    @friends = @user.accepted_friends
    @friendship = Friendship.new
    @friend_status = friend_status(@user)
    @events = @user.events.select do |event|
      event.is_private? == "Public" && event.going.map(&:user_id).include?(@user.id)
    end
    @events = @events.sort_by { |event| event.date }
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(users_params)
    @user.email = @user.email.downcase
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're logged in!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Your sign up information is invalid, please try again."
      render new_user_path
    end
  end
  def dashboard
    @friends = current_user.accepted_friends
    @current_user = current_user
    @friend_requests = current_user.pending_friend_requests
    @friendship = Friendship.new
    @events = @current_user.events.sort_by { |event| event.date }
  end
  def edit
    @current_user = current_user
  end
  def update
    # byebug
    @current_user = current_user
    if @current_user.update(users_params)
      redirect_to user_dashboard_path
    else
      flash.now[:notice] = "Information entered was invalid, please try again."
      render :edit
    end
  end
  def destroy
  end
  private
  def users_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :birthday, :bio, :profile, :embed)
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
