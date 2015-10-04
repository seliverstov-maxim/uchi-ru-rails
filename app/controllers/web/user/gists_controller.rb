class Web::User::GistsController < Web::User::ApplicationController
  before_filter :authorized?

  def index
    @gists = current_user.gists.active.ordered.paginate(page: params[:page])
  end

  def new
    @gist = Gist.new
  end

  def create
    @gist = Gist.new(gist_params)
    @gist.owner = current_user
    if @gist.save
      redirect_to gist_path(@gist), notice: t('.success_gist_creation')
    else
      flash.now[:error] = t('.failed_gist_creation')
    end
  end

  def edit
    @gist = current_user.gists.find_by(id: params[:id])

    if @gist.blank?
      redirect_to gists_path, error: t('.gist_not_found')
      return
    end

    authorize_action_for @gist
  end

  def update
    @gist = current_user.gists.find_by(id: params[:id])

    if @gist.blank?
      redirect_to gists_path, error: t('.gist_not_found')
      return
    end

    authorize_action_for @gist

    if @gist.update(gist_params)
      redirect_to gist_path(@gist), notice: t('.success_gist_update')
    else
      flash.now[:error] = t('.failed_gist_update')
    end
  end

  def destroy
    gist = current_user.gists.find_by(id: params[:id])

    if gist.blank?
      redirect_to gists_path, error: t('.gist_not_found')
      return
    end

    authorize_action_for gist

    gist.mark_as_deleted
    if gist.reload.deleted?
      redirect_to user_gists_path, notice: t('.success_gist_deleted')
    else
      redirect_to user_gists_path, error: t('.failed_gist_deleted')
    end
  end

  private

  def gist_params
    params.require(:gist).permit(:description, :content, :public, :language)
  end
end
