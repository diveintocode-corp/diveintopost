class RemoveAgendaMailer < ApplicationMailer
  default from: 'from@example.com'

  def remove_agenda_mail(user,agenda)
    @user = user
    @agenda = agenda
    mail to: user.email, subject: 'Agendaが削除されました'
  end
end
