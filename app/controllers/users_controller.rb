class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #binding.pry
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for registering"
      redirect_to :root
    else
      flash[:warning] = "Oops...Thanks for trying to register but there are some errors: <br/> #{@user.errors.full_messages.join('<br/> ')}".html_safe
      #binding.pry
      render :new
    end
  end
end