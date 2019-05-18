class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show
    @working_team = @team
    current_user.change_keep_team(@team)
  end

  def new
    @team = Team.new
  end

  def edit
    redirect_to :back, notice: 'リーダー以外はチーム情報を編集出来ません。' if current_user != @team.owner
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'チーム作成に成功しました！'
    else
      flash.now[:error] = '保存に失敗しました、、'
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'チーム更新に成功しました！'
    else
      flash.now[:error] = '保存に失敗しました、、'
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'チーム削除に成功しました！'
  end

  def transfer_owner
    repository = TeamTransferService.new(params)
    redirect_to repository.team, notice: repository.transfer ?
      'チームリーダーを変更しました！' :
      'チームリーダーを変更することができませんでした'
  end

  def dashboard
    @team = current_user.keep_team
  end

  private

  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit(
      :name,
      :icon,
      :icon_cache,
      :keep_team_id,
      :team_id
    ).merge(
      owner_id: current_user.id
    )
  end

  def assign_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
end
