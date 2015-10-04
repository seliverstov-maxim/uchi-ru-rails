class Web::UsersController < Web::ApplicationController
  def new
    @user = Web::RegistrationUserType.new
  end

  def create
    @user = Web::RegistrationUserType.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to gists_path, notice: t('.success_signup')
    else
      flash.now[:error] = t('.fail_signup')
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end
end
