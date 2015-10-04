class Web::CommentsController < Web::ApplicationController
  def create
    @gist = Gist.find(params[:gist_id])

    @comment = Comment.new(comment_params)
    @comment.assign_attributes(owner: current_user, commentable: @gist)
    @comment.save

    respond_to do |format|
      format.html {
        if @comment.errors.any?
          flash.now[:error] = t('.failed_comment_creation')
        else
          redirect_to gist_path(@gist), notice: t('.success_comment_creation')
        end
      }

      format.js {
        @comment = Comment.new if @comment.errors.empty?
        render layout: nil
      }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :owner_id, :commentable_id)
  end

  def gist_id
    params[:gist_id]
  end
end
