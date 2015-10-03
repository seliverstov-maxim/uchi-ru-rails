class Web::GistsController < Web::ApplicationController
  def index
    @gists = Gist.ordered.public_only.active.paginate(page: params[:page])
  end

  def show
    gist = Gist.find(params[:id])
    if gist.present? && (gist.owner == current_user || gist.public?)
      @gist = Web::GistDecorator.new(gist)
    else
      redirect_to gists_path(gist), notice: t('.gist_not_allowed')
    end
  end
end
