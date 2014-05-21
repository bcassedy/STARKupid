module SessionsHelper
  def current_user
    return nil if session[:token].nil?
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signin_user!(user)
    user.session_token = SecureRandom.hex
    user.save!
    @current_user = user
    session[:token] = user.session_token
  end
end
