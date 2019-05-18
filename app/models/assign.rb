class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team

  before_destroy :check_destroy

  def check_destroy
    self.errors.add(:user_id, ' リーダーは削除できません。') if self.user == self.team.owner
    self.errors.add(:user_id, ' リーダー以外は、他のメンバーを削除出来ません。') if self.user != User.current_user && User.current_user != self.team.owner
    self.errors.add(:user_id, ' このユーザーはこのチームにしか所属していないため、削除できません。') if Assign.where(user_id: self.user.id).count == 1
    throw :abort if self.errors.full_messages.length > 0
  end
end
