class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Signed in successfully!'
    else
      flash.now[:alert] = 'Username is invalid'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out successfully!'
  end
end
