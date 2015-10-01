class Web::UsersController < Web::ApplicationController
  def new
    @user = Web::RegistrationUserType.new
  end

  def create
    @user = Web::RegistrationUserType.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: t('.success_signup')
    else
      flash[:notice] = t('fail_signup')
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end
end
