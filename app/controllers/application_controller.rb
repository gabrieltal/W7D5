class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    # debugger
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def logout
    if current_user
      current_user.reset_token
      session[:session_token] = nil
    end
  end

  def login(user)
    user.reset_token
    # debugger
    session[:session_token] = user.session_token
  end

  def require_login
    redirect_to session_url unless signed_in?
  end
end
