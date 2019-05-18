class AgendaCreateService < BaseService

  concerning :TeamBuilder do
    attr_reader :team_id
    def team
      @team ||= Team.friendly.find(team_id)
    end
  end

  concerning :Agendauilder do
    attr_reader :title
    def agenda
      @agenda ||= User.current_user.agendas.build(title: title)
    end
  end

  def create
    build_associate
    return false if !validate

    build_associate

    if agenda.save
      @errors.push('team is not valid') unless User.current_user&.change_keep_team(team)
      true
    else
      @errors.push(agenda.errors&.full_messages&.first)
      false
    end
  end

  private

  def build_associate
    agenda.team = team
  end

  def validate
    @errors = []
    @errors.push('please login') unless User.current_user.present?
    @errors.push('title is not valid') unless agenda.present?
    @errors.push('team is not exists') unless team.present?

    return User.current_user.present? &&
           agenda.present? &&
           team.present?
  end
end
