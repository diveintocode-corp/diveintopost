class OwnerMailer < ApplicationMailer
   default from: 'from@example.com'

  def owner_mail(team)
    @team = team
    mail to: @team.owner.email, subject: I18n.t('views.messages.complete_owner_assign')
  end
end
