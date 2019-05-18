class TeamMailer < ApplicationMailer
  default from: 'from@example.com'

  def team_mail(email, team)
    @email = email
    @team = team
    mail to: @email, subject: 'リーダー変更完了'
  end
end
