class AgendasController < ApplicationController
  # before_action :set_agenda, only: %i[show edit update destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(agenda_params)
    @agenda.team_id = params[:team_id]
    if @agenda.save
      redirect_to team_agendas_url(@agenda), notice: 'Agenda was successfully created.'
    else
      render :new
    end
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[
      title description
    ]
  end
end
