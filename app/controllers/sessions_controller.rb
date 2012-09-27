class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.authenticate(params[:user])
      session[:user_id] = user.id
      redirect_to mails_path, notice: "logged in"
    else
      flash.now[:error] = "invalid!"
      render :new
    end
  end

  def create_with_persona
    if user = User.authenticate_with_persona(params[:assertion])
      session[:user_id] = user.id
      flash.now[:notice] =  "logged in"
      render json: { redirect_to: root_path }
    else
      head(:forbidden)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
