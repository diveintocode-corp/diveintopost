class SlackApi
  attr_reader :client

  DEFAULT_USERNAME = 'DiC BOT'
  DEFAULT_CHANNEL  = ENV['SLACK_POST_CHANNEL']

  def initialize
    @client = Slack::Web::Client.new
  end

  def post_message(text, channel: DEFAULT_CHANNEL, username: DEFAULT_USERNAME)
    client.chat_postMessage(channel: channel, text: text, username: username)
  end
end