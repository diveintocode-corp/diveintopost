class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
end
