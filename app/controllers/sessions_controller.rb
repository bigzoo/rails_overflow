class SessionsController < ApplicationController
  before_action :authorize, only: [:destroy]
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    username = User.find_by_username(params[:email])
    if user && user.authenticate(params[:password])
      flash[:alert] = "Succesful"
      session[:user_id] = user.id
      redirect_to root_path
    elsif username && username.authenticate(params[:password])
      flash[:alert] = "Succesful"
      session[:user_id] = username.id
      redirect_to root_path
    else
      flash[:alert] = "Email or password wrong"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert:'Out you go!'
  end
end
