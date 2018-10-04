class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(user, sample)
    @user = user
    @sample = sample
    mail to: @user.email, subject: "登録完了"
  end
end
