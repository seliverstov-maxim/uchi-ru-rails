class Web::User::GistsController < Web::User::ApplicationController

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
      flash[:notice] = t('.failed_gist_creation')
    end
  end

  def edit
    @gist = current_user.gists.find_by(id: params[:id])
    if @gist.blank?
      redirect_to gists_path, notice: t('.you_can_not_edit_gist')
      return
    end
  end

  def update
    @gist = current_user.gists.find_by(id: params[:id])
    if @gist.blank?
      redirect_to gists_path, notice: t('.you_can_not_update_gist')
      return
    end

    if @gist.update(gist_params)
      redirect_to gist_path(@gist), notice: t('.success_gist_creation')
    else
      flash[:notice] = t('.failed_gist_creation')
    end
  end

  def destroy
    gist = current_user.gists.find_by(id: params[:id])
    if gist.blank?
      redirect_to gists_path, notice: t('.you_can_not_destroy_gist')
      return
    end

    gist.mark_as_deleted
    if gist.reload.deleted?
      redirect_to user_gist_path(gist), notice: t('.success_gist_deleted')
    else
      redirect_to user_gist_path(gist), notice: t('.failed_gist_deleted')
    end
  end

  private

  def gist_params
    params.require(:gist).permit(:description, :content, :public, :language)
  end

  def show
      #route should be removed
  end
end
