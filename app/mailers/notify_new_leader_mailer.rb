class NotifyNewLeaderMailer < ApplicationMailer
    default from: 'from@example.com'
  
    def notify_new_leader_mail(user, team)
      @user = user
      @team = team
      mail to: user.email, subject: 'あなたはチームのリーダーになりました。'
    end
  end 