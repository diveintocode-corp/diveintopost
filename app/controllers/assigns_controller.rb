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
    destroy_message = assign_destroy(assign, assign.user)

    redirect_to team_url(params[:team_id]), notice: destroy_message
  end

  def update
    team = Team.friendly.find(params[:team_id])
    if current_user.id == team.owner_id
      assign_id = params[:id]
      assign = Assign.find(params[:id])
      team.owner_id = assign.user_id
      if team.save
        user = User.find(assign.user_id)
        AssignMailer.update_mail(user.email, team.name).deliver
        redirect_to team_url(team), notice: '成功しました！'
      else
        redirect_to team_url(team), notice: '失敗しました。'
      end
    else
      redirect_to team_url(team), notice: 'オーナー権限が渡されました！'
    end
  end

  private

  def assign_params
    params[:email]
  end

  def assign_destroy(assign, assigned_user)
    if assigned_user == assign.team.owner
      'リーダーは削除できません。'
    elsif Assign.where(user_id: assigned_user.id).count == 1
      'このユーザーはこのチームにしか所属していないため、削除できません。'
    elsif current_user != assign.team.owner && current_user != assign.user
      'チームリーダーかユーザー自身以外は削除できません。'
    elsif assign.destroy
      set_next_team(assign, assigned_user)
      'メンバーを削除しました。'
    else
      'なんらかの原因で、削除できませんでした。'
    end
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def set_next_team(assign, assigned_user)
    another_team = Assign.find_by(user_id: assigned_user.id).team
    change_keep_team(assigned_user, another_team) if assigned_user.keep_team_id == assign.team_id
  end
end
