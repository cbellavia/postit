class SessionsController < ApplicationController

  def new
   
  end
  
  def create
    #binding.pry
    @user = User.where("LOWER(username) = ?", params[:username].downcase).first
    if @user
      #binding.pry
      unless @user.authenticate(params[:password])
        flash[:warning] = "Oops. The password you entered isn't correct."
        redirect_to login_path 
      else
        flash[:notice] = "Thank you for signing in #{@user.username}"
        session[:user_id] = @user.id
        redirect_to root_path
      end
    else
      flash[:warning] = "The username does not exist.  Please verify the username or #{view_context.link_to("register", new_user_path) } for a new account".html_safe
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end