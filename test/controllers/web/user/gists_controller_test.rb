require 'test_helper'

class Web::User::GistsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @gist = create :gist, owner: @user
    @gist_params = attributes_for :gist, owner: @user

    sign_in(@user)
  end

  test 'get index gists' do
    get :index
    assert_response :success
  end

  test 'new gist' do
    get :new
    assert_response :success
  end

  test 'edit gist' do
    get :edit, id: @gist
    assert_response :success
  end

  test 'create gist' do
    post :create, gist: @gist_params
    assert_response :redirect

    gist = Gist.find_by(description: @gist_params[:description])
    assert { gist.present? }
  end

  test 'update gist' do
    patch :update, id: @gist, gist: @gist_params
    assert_response :redirect

    @gist.reload
    assert { @gist.description == @gist_params[:description] }
    assert { @gist.content == @gist_params[:content] }
  end

  test 'destroy gist' do
    delete :destroy, id: @gist
    assert { @gist.reload.deleted? }
  end
end
