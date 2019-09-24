class TeamMailer < ApplicationMailer
  default from: 'from@example.com'

  def transfer_mail(email, team_name)
    @email = email
    @team_name = team_name
    mail to: @email, subject: 'オーナーが変更されました。'
  end
end
