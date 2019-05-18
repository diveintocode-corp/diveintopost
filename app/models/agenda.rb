class Agenda < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :articles, dependent: :destroy
  validates :title, title: true

  before_destroy :check_authority
  after_destroy :send_delete_agenda_mail

  def check_authority
    self.errors.add(:title, ' 所有者のみ削除可能') unless User.current_user == self.user
    self.errors.add(:title, ' チームのリーダーのみ削除可能') unless User.current_user == self.team.owner
    throw :abort if self.errors.full_messages.length > 0
  end

  def send_delete_agenda_mail
    self.team.assigns.each do |assign|
      email = assign.user.email
      AgendaMailer.agenda_mail(email, self).deliver
    end
  end
end
