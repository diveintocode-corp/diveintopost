class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, inverse_of: :assign

  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :articles, dependent: :destroy

  def invite_member(user)
    assigns.create(user: user)
  end
end
