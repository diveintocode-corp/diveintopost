class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def set_slack_api
    @slack_api = SlackApi.new
  end
end
