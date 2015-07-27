class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to root_path, notice: "Logged in #{current_user}"
    else
      flash.now.alert = 'Invalid login credentials'
      render 'new'
    end
  end

  def destroy
    redirect_to root_path, notice: "Logged out #{current_user}!"
  end

end
