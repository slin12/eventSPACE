class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user



  def authorize_user
    unless logged_in?
      flash[:notice] = 'You are not authorized to view this page, log in first.'
      redirect_to root_path
    end
  end

  def current_user
    User.find(session[:user_id])
  end
  
  def logged_in?
    !!session[:user_id]
  end

end
