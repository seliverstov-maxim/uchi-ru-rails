class Web::GistsController < Web::ApplicationController
  def index
    @gists = Gist.ordered.public_only.active.paginate(page: params[:page])
  end

  def show
    gist = Gist.active.find_by(id: params[:id])

    if gist.blank?
      flash[:error] = t('.gist_not_found')
      redirect_to gists_path(gist)
      return
    end

    authorize_action_for gist

    @gist = Web::GistDecorator.new(gist)
  end
end
