class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.friendly.find(params[:team_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: 'アサインしました！'
    else
      redirect_to team_url(team), notice: 'アサインに失敗しました！'
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    assigned_user = assign.user
    if assigned_user == assign.team.owner
      redirect_to team_url(params[:team_id]), notice: 'リーダーは削除できません。'
    elsif Assign.where(user_id: assigned_user.id).count == 1
      redirect_to team_url(params[:team_id]), notice: 'このユーザーはこのチームにしか所属していないため、削除できません。'
    else
      another_team = Assign.find_by(user_id: assigned_user.id).team
      change_keep_team(assigned_user, another_team) if assigned_user.keep_team_id == assign.team_id
      assign.destroy
      redirect_to team_url(params[:team_id]), notice: 'メンバーを削除しました。'
    end
  end

  private

  def assign_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
end
