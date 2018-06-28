class AgendasController < ApplicationController
  def index
    @agendas = Agenda.all
  end

  def new
    @agenda = Agenda.new
  end
end
