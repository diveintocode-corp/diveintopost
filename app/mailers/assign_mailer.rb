class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email, subject: I18n.t('views.messages.complete_registration')
  end

  def leader_assigned(email, team)
    @email = email
    @team = team
    mail to: @email, subject:  I18n.t('views.messages.assign_leader.subject')
  end
end