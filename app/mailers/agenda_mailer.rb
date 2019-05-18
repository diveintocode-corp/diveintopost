class AgendaMailer < ApplicationMailer
  default from: 'from@example.com'

  def agenda_mail(email, agenda)
    @email = email
    @agenda = agenda
    mail to: @email, subject: 'Agenda削除通知'
  end
end
