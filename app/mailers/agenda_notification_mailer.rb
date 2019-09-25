class AgendaNotificationMailer < ApplicationMailer
  default from: 'from@example.com'

  def notification_mail(email)
    @email = email
    mail to: @email, subject: "通知メール：アジェンダが削除されました。"
  end
end