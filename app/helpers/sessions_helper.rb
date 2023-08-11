module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if user_id = session[:user_id]
      if @current_user.nil?
        @current_user = User.find_by(id: session[:user_id])
      else
        @current_user
      end
    elsif user_id = cookies.encrypted[:user_id]
      user = User.find_by(id: user_id)
      if user && user.autehnticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user_id
    cookies.permanent[:remember_token] = user.remember_token
  end

end
