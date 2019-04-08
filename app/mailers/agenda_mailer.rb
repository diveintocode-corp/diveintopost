class AgendaMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def agenda_mail(agenda)
    @agenda = agenda

    mail to: @agenda, subject: "Agenda削除メール"
  end
end
