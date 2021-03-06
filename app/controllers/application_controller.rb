class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if  session[:user_id]
  end
  helper_method :current_user
  def authorize
    if current_user.nil?
      flash[:alert] = 'Please Log In First'
      redirect_to login_path
    end
  end
  def admin
    if !current_user.admin
      flash[:alert] = 'Not Authorized!'
      redirect_to root_path
    end
  end
end
