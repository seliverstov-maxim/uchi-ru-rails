require 'test_helper'

class Web::GistsControllerTest < ActionController::TestCase
  def setup
    @gist = create :gist
  end

  test 'get index gists' do
    get :index
    assert_response :success
  end

  test 'show gist' do
    get :show, id: @gist
    assert_response :success
  end
end
