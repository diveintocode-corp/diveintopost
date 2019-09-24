class TeamPolicy < ApplicationPolicy
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
    is_owner?
  end

  def edit?
    is_owner?
    update?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    record.owner_id == user.id
  end
end
