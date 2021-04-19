module UsersHelper
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username)
  end

  def start_session(user)
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "User #{user.name} account signed up successfully!"
    else
      flash.now[:alert] = 'Username is invalid'
    end
  end
end
