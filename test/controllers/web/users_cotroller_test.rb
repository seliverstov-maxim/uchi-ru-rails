require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    @params = attributes_for :registration_user
  end

  test 'get user form' do
    get :new
    assert_response :success
  end

  test 'create user' do
    post :create, user: @params
    assert_response :redirect

    user = User.find_by(email: @params[:email])
    assert { user.present? }
  end
end
