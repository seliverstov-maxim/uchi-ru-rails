class Web::SessionsController < Web::ApplicationController
  def new
    @user = Web::AuthUserType.new
  end

  def create
    auth_user = Web::AuthUserType.find_by(email: user_params[:email])
    if auth_user.try(:authenticate, user_params[:password])
      sign_in(auth_user)
      redirect_to root_path, notice: t('.success_auth')
    else
      @user = Web::AuthUserType.new(user_params)
    end
  end

  def destroy
    user = Web::AuthUserType.find_by(id: params[:id])
    sign_out(user)
    redirect_to root_path, notice: t('.success_logout')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
