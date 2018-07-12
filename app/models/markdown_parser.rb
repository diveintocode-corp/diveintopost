class MarkdownParser < Redcarpet::Render::HTML
  def block_code(code, language)
    language = language.split(':')[0]
    lang = case language.to_s
           when 'rb'
             'ruby'
           when 'yml'
             'yaml'
           when 'css'
             'css'
           when 'html'
             'html'
           when ''
             'md'
           else
             language
           end
    CodeRay.scan(code, lang).div
  end
end
