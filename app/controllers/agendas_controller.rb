class AgendasController < ApplicationController
  # before_action :set_agenda, only: %i[show edit update destroy]

  def index
    @agendas = Agenda.all
    # binding.pry
    # @agenda = Agenda.find_by(id: params[:id])
    # @articles = Article.find_by(id: @agenda)
    # @articles = Article.find_by(agenda_id: params[:agenda_id])
  end

  def new
    @team = Team.find(params[:team_id])
   # if params[:back]
     # @agenda = Agenda.new(agenda_params)
    # else
      @agenda = Agenda.new
    # end
  end

  def create
    # @team = Team.find(params[:team_id])
    # @team.id
    @agenda = current_user.agendas.build(agenda_params)
    # binding.pry
    @agenda.team_id = params[:team_id]
    # @agenda.user_id = current_user.id

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
