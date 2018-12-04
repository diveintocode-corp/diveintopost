class ApplicationController < ActionController::Base
  before_action :init_team, if: :user_signed_in?
  before_action :set_working_team, if: :user_signed_in?

  def change_keep_team(user, current_team)
    user.keep_team_id = current_team.id
    user.save!
  end

  private

  def set_working_team
    @working_team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : Team.first
  end

  def init_team
    current_user.assigns.create!(team_id: Team.first.id) if current_user.teams.blank?
  end
end
