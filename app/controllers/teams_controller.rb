class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show edit update destroy]
  before_action :exclude_without_owner, only: %i[edit]


  def index
    @teams = Team.all
  end

  def show
    @working_team = @team
    change_keep_team(current_user, @team)
  end

  def new
    @team = Team.new
  end

  def edit; end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to @team, notice: I18n.t('views.messages.create_team')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: I18n.t('views.messages.update_team')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_team')
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: I18n.t('views.messages.delete_team')
  end

  def dashboard
    @team = current_user.keep_team_id ? Team.find(current_user.keep_team_id) : current_user.teams.first
  end

  def change_owner
    if current_user.is_owner?(@working_team)
      @working_team.owner_id = params[:id]
      @working_team.save
      new_owner = @working_team.owner
      NominatedToOwnerMailer.nominated_to_owner_mail(new_owner).deliver
      redirect_back(fallback_location: team_path(@working_team))
    else
      I18n.t('views.messages.no_authority_without_owner')
    end
  end

  private

  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit %i[name icon icon_cache owner_id keep_team_id]
  end

  def exclude_without_owner
    unless current_user.is_owner?(@team)
      redirect_back(fallback_location: team_path(@working_team), notice: I18n.t('views.messages.no_authority_without_owner'))
    end  
  end  
end