module ApplicationHelper
  def markdown(text)
    html_render = MarkdownParser.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  # FIXME: dashboardに戻るURLは要検討
  def back_to_dashboard_url
    team_url(current_user.teams.first) if user_signed_in?
  end
end
