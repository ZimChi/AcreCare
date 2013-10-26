class CertificateMailer < ActionMailer::Base
  default from: 'Amazon Aid Foundation <info@amazonaid.org>'

    def eCard(certificate, recipient_email, sender_name, messsage)
      @messsage = messsage

      attachments['AAFCertificate.pdf'] = certificate.render
      mail(to: recipient_email, subject: "An eCard from #{sender_name}")
    end

    def eCardConfirmation(sender_email)
      mail(to: sender_email, subject: 'eCard delivery Confirmation from Amazon Aid Foundation')
    end

end


