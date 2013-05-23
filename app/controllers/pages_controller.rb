class PagesController < ApplicationController

  def thanks
    Rails.logger.info params[:certificate]
  end

  def about
    respond_to do |format|
      format.html #{ render :layout => false }
    end
  end

  def customize_certificate

  end

  def certificate
    cookies[:fileDownload] = {
      :value => true,
      :path => '/'
    }
    pdf = Prawn::Document.new(:page_layout => :landscape)
    pdf.image Rails.application.assets['cert.png'], :at => [-50,600], :scale => 0.55
    send_data pdf.render, :filename => "AAFCertificate.pdf", :type => "application/pdf"

  end


end
