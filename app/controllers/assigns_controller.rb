class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.find(params[:team_id])
    user = User.find_or_create_by_email(assign_params)
    team.invite_member(user)
    redirect_to team_url(team), notice: 'Completed assign!'
  end

  private

  def assign_params
    params[:email]
  end
end
