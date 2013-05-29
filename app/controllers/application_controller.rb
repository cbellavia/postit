class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  def require_user
    unless logged_in?
      
      respond_to do |format|
       format.html { 
        flash[:error] = "Before you do that...Please sign in or register."
        redirect_to login_path 
        }
       format.js { 
        flash.now[:error] = "Before you do that...Please sign in or register."
        render "/sessions/sign_in"}
      end
      
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # !! will always return either true or false
    !!current_user
  end
end
