class DestroyAgendaMailer < ApplicationMailer
  def destroy_agenda_mail(agenda)
    team = agenda.team_id
    target_users = User.where(keep_team_id: team)
    target_users.each do |target_user|
      mail to: target_user.email, subject: I18n.t('views.messages.complete_registration')
    end
  end
end