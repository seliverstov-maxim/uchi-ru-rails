class Web::ApplicationController < ApplicationController
  include Web::AuthService
  include Web::LocaleService

  layout 'superhero'

  helper_method :current_user, :current_locale

  before_filter :set_locale

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :error => 'You are not authorized to complete that action.'
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
