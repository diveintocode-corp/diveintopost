class SlackApi
  include Rails.application.routes.url_helpers

  attr_reader :client

  DEFAULT_USERNAME = 'DiC BOT'
  DEFAULT_CHANNEL  = ENV['SLACK_POST_CHANNEL']
  WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

  def initialize(webhook_url=WEBHOOK_URL, channel: DEFAULT_CHANNEL, username: DEFAULT_USERNAME)
    @client = Slack::Incoming::Webhooks.new(webhook_url, channel: channel, username: username)
  end

  def post_message(title, article, user)
    attachments = [{
                     color: 'good',
                     author_name: user.name,
                     title: title,
                     title_link: article_url(article),
                     text: article.content
                   }]
    client.post('', attachments: attachments)
  end
end