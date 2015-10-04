require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @gist = create :gist, owner: @user
    @comment = create :comment, owner: @user, commentable: @gist
    @comment_params = attributes_for :comment, owner: @user, commentable: @gist

    sign_in(@user)
  end

  test 'post create comment html' do
    post :create, gist_id: @gist.id, comment: @comment_params, format: :html
    assert_response :redirect

    assert { Comment.find_by(content: @comment_params[:content]).present? }
  end

  test 'post create comment js' do
    post :create, gist_id: @gist.id, comment: @comment_params, format: :js
    assert_response :success

    assert { Comment.find_by(content: @comment_params[:content]).present? }
  end
end
