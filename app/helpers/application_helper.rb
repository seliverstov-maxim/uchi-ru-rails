module ApplicationHelper
  def gist_languages_collection
    CodeRay::Scanners.list.map{|lang| [lang, lang]}
  end
end
