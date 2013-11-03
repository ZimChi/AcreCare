class PagesController < ApplicationController
  include PagesHelper

  def thanks
    begin
      @donation = Donation.find_by_id(cookies[:donation])
      @parcel = Parcel.find_by_title(@donation.parcel)
    rescue
      redirect_to '/'
    end
  end

  def about
    respond_to do |format|
      format.html #{ render :layout => false }
    end
  end

   def ecard
    cookies[:fileDownload] = { :value => true, :path => '/' }

    @donation = Donation.find_by_id(cookies[:donation])
    @parcel = Parcel.find_by_id(cookies[:parcel])

    acrename =  params[:certificate_acrename]
      acrename.empty? ? acrename = "" : acrename = params[:certificate_acrename].split(' ').map {|w| w.capitalize }.join(' ')
    @donation.acrename = acrename
    @donation.recipient_firstname = params[:certificate_recipient_firstname]
    @donation.recipient_lastname = params[:certificate_recipient_lastname]
    @donation.recipient_email =  params[:certificate_recipientemail]
    @donation.parcel = @parcel.id
    @donation.save
    @donation.numberofacres==1 ? acre_verbiage = 'one acre' : acre_verbiage = "#{@donation.numberofacres} acres"
    messsage = params[:certificate_personalizedmessage]
    certificate = generate_certificate(acrename, acre_verbiage, @parcel)

    CertificateMailer.eCard(certificate, @donation, messsage, acre_verbiage).deliver

    #CertificateMailer.eCardConfirmation(sender_email).deliver

    render :nothing => true
   end

  def certificate
      cookies[:fileDownload] = { :value => true, :path => '/' }
      @donation = Donation.find_by_id(cookies[:donation])
      @parcel = Parcel.find_by_id(cookies[:parcel])

      acrename =  params[:certificate_acrename]; acrename.empty? ? acrename = "" : acrename = params[:certificate_acrename].split(' ').map {|w| w.capitalize }.join(' ')
      @donation.acrename = acrename
      @donation.recipient_firstname = params[:certificate_recipient_firstname]
      @donation.recipient_lastname = params[:certificate_recipient_lastname]
      @donation.recipient_email =  params[:certificate_recipientemail]
      @donation.parcel = @parcel.id
      @donation.save
      @donation.numberofacres==1 ? acre_verbiage = 'one acre' : acre_verbiage = "#{@donation.numberofacres} acres"
      messsage = params[:certificate_personalizedmessage]
      certificate = generate_certificate(acrename, acre_verbiage, @parcel)

      send_data certificate.render, :filename => "AAFCertificate.pdf", :type => "application/pdf"
  end

end
