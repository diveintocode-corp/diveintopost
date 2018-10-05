class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.friendly.find(params[:team_id])
    user = User.find_or_create_by_email(assign_params)
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: 'Completed assign!'
    else
      redirect_to team_url(team), notice: 'Not assign!'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @assign = Assign.find(params[:id])
    if @assign.user_id == @team.owner_id
      redirect_to team_url(params[:team_id]), notice: 'リーダーは削除できません。'
    else
      @assign.destroy
      redirect_to team_url(params[:team_id]), notice: 'メンバーを削除しました。'
    end
  end

  private

  def assign_params
    params[:email]
  end
end
