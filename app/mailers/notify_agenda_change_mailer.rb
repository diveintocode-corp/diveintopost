class NotifyAgendaChangeMailer < ApplicationMailer
  default from: 'from@example.com'

  def notify_agenda_change_mail(member,agenda)
    @member = member
    @agenda = agenda
    mail to: member.email, subject: 'Agendaが削除されました'
  end
end