class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to root_path, flash: {error: 'Sealed by Signet'}
    end
  end
end
