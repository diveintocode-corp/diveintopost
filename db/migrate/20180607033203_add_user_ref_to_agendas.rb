class AddUserRefToAgendas < ActiveRecord::Migration[5.2]
  def change
    add_reference :agendas, :user, foreign_key: true
  end
end
