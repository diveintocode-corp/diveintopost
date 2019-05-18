class Agenda < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :articles, dependent: :destroy
  validates :title, title: true

  before_destroy :check_authority
  after_destroy :send_delete_agenda_mail

  def check_authority
    User.current_user == self.user || User.current_user == self.team.owner
  end

  def send_delete_agenda_mail
    self.team.assigns.each do |assign|
      email = assign.user.email
      AgendaMailer.agenda_mail(email, self).deliver
    end
  end
end
