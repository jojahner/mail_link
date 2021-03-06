class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:user])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "logged in"
    else
      flash.now[:error] = "invalid!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
