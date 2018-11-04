class CheckFacebookNotificationsJob < ApplicationJob
  queue_as :default

  def perform
    # Pega todos os Disappeared que tem email e senha diferente de nul
    Disappeared.containing_email_password.each do |disappeared|
      # Para cada Disappeared, checa se tem notificao
      check_facebook_notification(disappeared)
    end
  end

  def check_facebook_notification(disappeared)
    mail_options = {
      address: 'outlook.office365.com',
      port: 993,
      user_name: disappeared.email,
      password: disappeared.password,
      enable_ssl: true
    }

    Mail.defaults do
      retriever_method :imap, mail_options
    end

    disappeared_update = disappeared

    @mail = Mail.new do

      Mail.all(keys: %w(NOT SEEN)) do |email, imap, message_id|
        if email.respond_to?(:subject) && email.subject.include?('marcou você')
          if disappeared_update.update_attribute(:notification_face, true)
            imap.uid_store(message_id, '+FLAGS', [Net::IMAP::SEEN] )
          end
        end
      end
    end
  end
end
