module Web::AuthService
  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out(user)
    session[:current_user_id] = nil
  end

  def current_user
    @current_user if @current_user.present?
    user = ::User.find_by(id: session[:current_user_id]) if session[:current_user_id].present?
    user ||= ::AnonumousUser.new
  end

  def authorized?
    return redirect_to root_path if current_user.guest?
  end
end
