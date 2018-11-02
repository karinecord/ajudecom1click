class ContactMailer < ApplicationMailer
  default from: "admin@anjosdobem.com"

  def contact_email(contact_params)
    @name = contact_params['name']
    @email = contact_params['email']
    @content = contact_params['content']

    mail(to: "anjosdobem@outlook.com", subject: t('text'))
  end
end
