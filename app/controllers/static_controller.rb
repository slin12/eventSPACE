class StaticController < ApplicationController

  def home
    if logged_in?
      redirect_to user_dashboard_path
    else
      render :layout => false
    end
  end

  def page_not_found
    render :page_not_found
  end


end
