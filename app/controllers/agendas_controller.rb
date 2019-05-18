class AgendasController < ApplicationController
  before_action :set_agenda, only: %i[show edit update destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    repository = AgendaCreateService.new(params)
    redirect_to dashboard_url, notice: repository.create ?
      'アジェンダ作成に成功しました！' :
      repository.errors.first
  end

  def destroy
    if @agenda.destroy
      redirect_to dashboard_path, notice: "アジェンダ「#{@agenda.title}」を削除しました！"
    else
      render :index, notice: @agenda.errors&.full_messages&.first
    end
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end
end
