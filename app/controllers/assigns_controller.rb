class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.friendly.find(params[:team_id])
    user = User.find_or_create_by_email(assign_params)
    team.invite_member(user)
    redirect_to team_url(team), notice: 'Completed assign!'
  end

  def destroy
    @team = Team.find(params[:id])
    @assign = Assign.find(params[:id])
    @assign.destroy
    redirect_to team_url(params[:team_id]), notice: 'メンバーを削除しました。'
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
