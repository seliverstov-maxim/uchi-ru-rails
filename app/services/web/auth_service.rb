module Web::AuthService
  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out(user)
    session[:current_user_id] = nil
  end

  def current_user
    return User.find_by(id: session[:current_user_id]) if session[:current_user_id].present?
    nil
  end
end
