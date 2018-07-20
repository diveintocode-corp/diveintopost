class ApplicationController < ActionController::Base
  before_action :set_working_team, if: :user_signed_in?

  private

  # FIXME: 暫定的にteamに値を入れる処理をかませる
  def set_working_team
    @working_team = current_user.teams.first
  end
end
