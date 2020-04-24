class AgendaDeleteMailer < ApplicationMailer
  default from: 'from@example.com'

  def agenda_delete_mail(agenda)
    @agenda = agenda
    @mailto = agenda.team.members.pluck(:email)
    mail to: @mailto, subject: I18n.t('views.messages.complete_agenda_delete')
  end
end
