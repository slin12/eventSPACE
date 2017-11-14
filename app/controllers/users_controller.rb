class UsersController < ApplicationController


  # def index
  # end

  def show
    @user = User.find(params[:id])

    if @user.friend?(User.find_by_id(session[:user_id])) && User.find_by_id(session[:user_id]).friend?(@user)
      @friend_status = "Friends"
    elsif @user.friend?(User.find_by_id(session[:user_id]))
      @friend_status = "Request Sent"
    elsif User.find_by_id(session[:user_id]).friend?(@user)
      @friend_status = "Accept Request"
    else
      @friend_status = "Add Friend"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're logged in! Welcome!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Your sign up information is invalid, please try again."
      render new_user_path
    end
  end

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

end
