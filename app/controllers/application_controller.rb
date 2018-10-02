class ApplicationController < ActionController::Base
  before_action :init_team, if: :user_signed_in?
  before_action :set_working_team, if: :user_signed_in?

  private

  # FIXME: 暫定的にteamに値を入れる処理をかませる。
  # 紐づいているTeamが一件もなかった場合、最初のTeam（BasicTeam（初期チーム））を登録する
  def set_working_team
    @working_team = Team.first
  end

  def init_team
    current_user.assigns.create!(team_id: Team.first.id) if current_user.teams.blank?
  end
end
