module Web::LocaleService
  def current_locale
    I18n.locale
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
