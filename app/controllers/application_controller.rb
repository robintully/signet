class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :unauthenticated_only, :authenticated_only

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def unauthenticated_only
    redirect_to root_path, notice: "You're already logged in" if logged_in?
  end

  def authenticated_only
    redirect_to sign_in_path, notice: "You must be logged in to do that" unless logged_in?
  end

end
