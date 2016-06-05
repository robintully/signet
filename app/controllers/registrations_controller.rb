class RegistrationsController < ApplicationController
  before_action :set_user, only: :new

  def new
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successful registration and login"
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end

end