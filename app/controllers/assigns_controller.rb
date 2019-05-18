class AssignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assign, only: [:destroy]

  def create
    repository = AssignInviteService.new(params)
    redirect_to team_url(repository.team), notice: repository.create ?
      'アサインしました！' :
      repository.errors.first
  end

  def destroy
    redirect_to team_url(params[:team_id]), notice: @assign.destroy ? 'メンバーを削除しました。' : @assign.errors&.full_messages&.first
  end

  private

  def set_assign
    @assign = Assign.find(params[:id])
  end
end
