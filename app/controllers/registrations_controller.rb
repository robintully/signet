class RegistrationsController < ApplicationController
  before_action :set_user, only: :new

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      user.set_confirmation_token
      user.save(validate: false)
      UserMailer.registration_confirmation(user).deliver_now
      redirect_to sign_in_path, flash: {success: "Confirmation sent to #{user.email_address} Please confirm your email address to continue"}
    else
      render :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user
      user.validate_email
      user.save(validate: false)
      session[:user_id] = user.id
      redirect_to user_path(user), flash: {success: "Thanks for confirming your email address!"}
    else
      redirect_to sign_up_path, flash: {error: "Sorry, user doesn't exist"}
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