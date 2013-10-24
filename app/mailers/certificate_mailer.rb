class CertificateMailer < ActionMailer::Base
  default from: 'Amazon Aid Foundation <info@amazonaid.org>'

    def eCard(certificate, recipient, sender, messsage)
      @messsage = messsage
      attachments['AAFCertificate.pdf'] = certificate.render
      mail(to: recipient, subject: "An eCard from #{sender}")
    end

    def eCardConfirmation(recipient)
      mail(to: recipient, subject: 'eCard delivery Confirmation from Amazon Aid Foundation')
    end

end


