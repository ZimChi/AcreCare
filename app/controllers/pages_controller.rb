class PagesController < ApplicationController
  include PagesHelper

  def thanks
    @parcel = Parcel.find_by_id(cookies[:parcel_id])
  end

  def about
    respond_to do |format|
      format.html #{ render :layout => false }
    end
  end

  def certificate
    cookies[:fileDownload] = { :value => true, :path => '/' }
    send_data generate_certificate.render, :filename => "AAFCertificate.pdf", :type => "application/pdf"
  end

end
