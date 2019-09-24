class AssignPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

	def destroy?
    user.id == record.user_id  or is_owner?
  end

  private

  def is_owner?
		record.team.owner_id == user.id
  end
end