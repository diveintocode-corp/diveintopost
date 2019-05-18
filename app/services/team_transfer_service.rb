class TeamTransferService < BaseService

  concerning :TeamBuilder do
    attr_reader :team_id
    def team
      @team ||= Team.friendly.find(team_id)
    end
  end

  concerning :AssignBuilder do
    attr_reader :id
    def assign
        @assign ||= Assign.find(id)
    end
  end

  def transfer
    return false if !validate

    build_associate

    return TeamMailer.team_mail(team.owner.email, team).deliver && team.save
  end

  private

  def build_associate
    team.owner_id = assign.user_id
  end

  def validate
    @errors = []
    true
  end
end
