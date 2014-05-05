module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.not_validate_password = true
    user.update_attributes(remember_token: User.digest(remember_token))
    user.not_validate_password = false
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    current_user.not_validate_password = true
    current_user.update_attributes(remember_token:
                                  User.digest(User.new_remember_token))
    current_user.not_validate_password = false
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
