class ContactMailer < ApplicationMailer
  def contact_email(contact_params)
    @name = contact_params['name']
    @email = contact_params['email']
    @content = contact_params['content']

    mail(to: "manager.ajudecom1click@outlook.com", subject: t('text'))
  end
end
