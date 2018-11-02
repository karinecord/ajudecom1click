class Site::ContactController < SiteController

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.valid?
    ContactMailer.contact_email(contact_params.to_hash).deliver_later
    redirect_to '/site/contact/new', notice: t('Message sent successfully')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :content)
  end
end
