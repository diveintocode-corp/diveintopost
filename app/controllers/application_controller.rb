class ApplicationController < ActionController::Base
  before_action :set_team, if: :user_signed_in?

  private

  # FIXME: 暫定的にteamに値を入れる処理をかませる
  def set_team
    @team = current_user.teams.first
  end
end
