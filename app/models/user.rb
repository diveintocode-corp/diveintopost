class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns
  has_many :articles, dependent: :destroy
  has_many :agendas, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, email: true

  belongs_to :keep_team, optional: true, class_name: 'Team', foreign_key: :keep_team_id

  mount_uploader :icon, ImageUploader

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end

    def generate_password
      SecureRandom.hex(10)
    end
  end

  def change_keep_team(current_team)
    self.keep_team_id = current_team.id
    self.save!
  end

  def keep_team
    unCheckedAssign = Assign.find_by(
      user_id: self.id,
      team_id: self.keep_team_id
    )
    if unCheckedAssign.nil?
      assigned_team = self.teams.first
      return Team.first if assigned_team.nil?
      self.change_keep_team(assigned_team)
      return assigned_team
    else
      return unCheckedAssign.team
    end
  end
end
