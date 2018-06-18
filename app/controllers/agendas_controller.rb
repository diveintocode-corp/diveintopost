class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]

  def index
    @agendas = Agenda.all
  end

  def show
    @team = @agenda.team
  end

  def new
    @team = Team.find(params[:team_id])
    if params[:back]
      @agenda = Agenda.new(agenda_params)
    else
      @agenda = Agenda.new
    end
  end

  def edit
  end

  def create
    # @team = Team.find(params[:team_id])
    # @team.id
    @agenda = current_user.agendas.build(agenda_params)
    # binding.pry
    @agenda.team_id = params[:team_id]
    # @agenda.user_id = current_user.id

      if @agenda.save
        redirect_to agenda_url(@agenda), notice: 'Agenda was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @agenda.update(agenda_params)
        redirect_to @agenda, notice: 'Agenda was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @agenda.destroy
      redirect_to teams_path, notice: 'Agenda was successfully destroyed.'
  end

  private
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    def agenda_params
      params.fetch(:agenda, {}).permit(:title, :description)
    end
end
