class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])
    if !@user
      @user = User.new
      redirect_to root_path
    elsif @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       flash[:notice] = "Welcome back!"
       redirect_to user_dashboard_path
    else
      flash.now[:notice] = "Login credentials were incorrect. Check your email and password and try again."
      @user = User.new
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
