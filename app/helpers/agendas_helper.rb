module AgendasHelper
  def choose_new_or_edit
    if action_name == 'new'
      team_agendas_path
    elsif action_name == 'edit'
      agenda_path
    end
  end
end
