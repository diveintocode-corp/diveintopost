class AddTeamRefToAgendas < ActiveRecord::Migration[5.2]
  def change
    add_reference :agendas, :team, foreign_key: true
  end
end
