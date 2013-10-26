class PagesController < ApplicationController
  include PagesHelper

  def thanks
    @donation = Donation.find_by_id(cookies[:donation_id])
    @parcel = Parcel.find_by_title(@donation.parcel)
  end

  def about
    respond_to do |format|
      format.html #{ render :layout => false }
    end
  end

   def ecard
    cookies[:fileDownload] = { :value => true, :path => '/' }
    sender_name = params[:certificate_username]
    sender_email =    params[:certificate_useremail]
    recipient_email = params[:certificate_recipientemail]
    acrename =  params[:certificate_acrename]; acrename.empty? ? acrename = "Anonymously" : acrename = params[:certificate_acrename].split(' ').map {|w| w.capitalize }.join(' ')
    message = params[:certificate_personalizedmessage]
    certificate = generate_certificate(acrename)

    CertificateMailer.eCard(certificate, recipient_email, sender_name, message).deliver  if !recipient_email.nil?
    CertificateMailer.eCardConfirmation(sender_email).deliver  if !sender_email.nil?

    render :nothing => true
   end

  def certificate
      cookies[:fileDownload] = { :value => true, :path => '/' }
      acrename =  params[:certificate_acrename]; acrename.empty? ? acrename = "" : acrename = params[:certificate_acrename].split(' ').map {|w| w.capitalize }.join(' ')
      send_data generate_certificate(acrename).render, :filename => "AAFCertificate.pdf", :type => "application/pdf"
  end

end
