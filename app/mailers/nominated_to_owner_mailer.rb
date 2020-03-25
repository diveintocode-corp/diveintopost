class NominatedToOwnerMailer < ApplicationMailer
  def nominated_to_owner_mail(new_owner)
    mail to: new_owner.email, subject: I18n.t('views.messages.nominated_to_owner')
  end
end