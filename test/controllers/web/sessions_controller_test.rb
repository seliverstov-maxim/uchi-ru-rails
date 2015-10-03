require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @params = attributes_for :auth_user, email: @user.email
  end

  test 'get auth form' do
    get :new
    assert_response :success
  end

  test 'create session' do
    post :create, user: @params
    assert_response :redirect

    user_id = session[:current_user_id]
    assert { user_id.present? }

    user = User.find(user_id)
    assert { user.email == @params[:email] }
  end

  test 'destroy session' do
    delete :destroy, id: @user
    assert_response :redirect

    assert { session[:current_user_id].nil? }
  end
end
