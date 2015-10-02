class Web::GistsController < Web::ApplicationController
  def index
    @gists = Gist.paginate(page: params[:page])
  end

  def show
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
