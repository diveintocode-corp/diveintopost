class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show
    @user = current_user
    @working_team = @team
    change_keep_team(current_user, @team)
  end

  def new
    @team = Team.new
  end

  def edit
    unless @team.owner.id == current_user.id
      redirect_to @team, notice: 'チーム編集の権限がありません'
    end
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
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
    if @team.owner.id == current_user.id
      @team.destroy
      redirect_to teams_url, notice: 'チーム削除に成功しました！'
    else
      flash.now[:error] = '削除できません'
    end
  end

  def dashboard
    @team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : current_user.teams.first
  end

  private

  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit %i[name icon icon_cache owner_id keep_team_id]
  end
end
