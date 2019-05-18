class AssignInviteService < BaseService
  include ApplicationHelper

  concerning :TeamBuilder do
    attr_reader :team_id
    def team
      @team ||= Team.friendly.find(team_id)
    end
  end

  concerning :UserBuilder do
    attr_reader :email
    def user
        @user ||= isEmail(email) ?
          User.find_by(email: email) :
          nil
    end
  end

  def create
    return false if !validate

    return team.invite_member(user)
  end

  private

  def validate
    @errors = []
    @errors.push('user is not exists') unless user.present?
    @errors.push('team is not exists') unless team.present?
    user.present? && team.present?
  end
end
