class CertificateMailer < ActionMailer::Base
  default from: 'Amazon Aid Foundation <info@amazonaid.org>'

    def eCard(certificate, donation, messsage, acre_verbiage)

      @donation = donation
      @acre_verbiage = acre_verbiage
      @messsage = messsage

      attachments['AAFCertificate.pdf'] = certificate.render
      mail(to: @donation.recipient_email, subject: "An eCard from #{@donation.donor_firstname}")
    end

    #def eCardConfirmation(sender_email)
    #  mail(to: sender_email, subject: 'eCard delivery Confirmation from Amazon Aid Foundation')
    #end

end


