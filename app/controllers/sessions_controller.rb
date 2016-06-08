class SessionsController < ApplicationController
  before_action :unauthenticated_only, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user.email_confirmed == false
      redirect_to sign_in_path, flash: {error: "Please confirm your email address to continue"}
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to sign_in_path, flash: {error: "Username or password incorrect"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {success: "You have successfully logged out"}
  end

end
