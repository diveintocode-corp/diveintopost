class ApplicationController < ActionController::Base
  before_action :init_team, if: :user_signed_in?
  before_action :set_working_team, if: :user_signed_in?

  private

  def set_working_team
    @working_team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : current_user.teams.first
  end

  def init_team
    current_user.assigns.create!(team_id: Team.first.id) if current_user.teams.blank?
  end
end
