class SessionsController < ApplicationController

  def create
   @user = User.find_by(email: params[:user][:email])
   if @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     # where to send user once they login?
     #redirect_to dashboard_path
  else
    flash.now[:notice] = "Login credentials were incorrect. Check your email and password and try again."
    @user = User.new
    # rerender the landing page
    render '/'
  end
 end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
