module PostMessageTransable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  def slack_message
    <<~EOS
      >>> *Created article* <#{article_url(self)}|#{title}> by #{user.name}
      #{content}
    EOS
  end
end