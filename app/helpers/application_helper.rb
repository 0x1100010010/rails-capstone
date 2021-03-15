module ApplicationHelper

  def current_user
    if session[:user_id]
      begin
        @current_user ||= User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
      # rescue Exception
      #   # handle everything else
      #   raise
      end
    else
      @current_user = nil
    end
  end

  def require_session
    redirect_to welcome_path, alert: 'Sign Up or Sign In to access this feature!' unless current_user
  end

end
