class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns
  has_many :articles, dependent: :destroy
  has_many :agendas, dependent: :destroy
  has_many :comments, dependent: :destroy

  belongs_to :keep_team, optional: true, class_name: 'Team', foreign_key: :keep_team_id

  mount_uploader :icon, ImageUploader

  def self.find_or_create_by_email(email)
    user = find_or_initialize_by(email: email)
    if user.new_record?
      user.password = generate_password
      user.save!
      AssignMailer.assign_mail(user.email, user.password).deliver
    end
    user
  end

  def self.generate_password
    SecureRandom.hex(10)
  end
end
