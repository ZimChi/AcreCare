class CertificateMailer < ActionMailer::Base
  default from: 'Amazon Aid Foundation <support@amazonaid.org>'

    def eCard(certificate, recipient, sender, messsage)
      @messsage = messsage
      attachments['ECard.pdf'] = certificate.render
      mail(from: 'Amazon Aid Foundation <support@amazonaid.org>', to: recipient, subject: "An eCard from #{sender}")
    end

    def eCardConfirmation(recipient)
      mail(reply_to: 'Amazon Aid Foundation', to: recipient, subject: 'eCard delivery Confirmation from Amazon Aid Foundation')
    end

end
