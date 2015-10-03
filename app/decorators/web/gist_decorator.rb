class Web::GistDecorator < Draper::Decorator
  delegate_all

  def highlighted_content
    return '' if object.language.blank?
    CodeRay.scan(object.content, object.language.to_sym).div
  end
end
