class SessionsController < ApplicationController
  before_action :unauthenticated_only, only: [:new, :create]

  def new
  end

  def create
    binding.pry
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to new_envelope_path
    else
      redirect_to sign_in_path, notice: "Username or password incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out"
  end

end
