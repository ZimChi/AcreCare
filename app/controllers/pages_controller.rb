class PagesController < ApplicationController

  def thanks

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

    #pdf = Prawn::Document.new #(:page_layout => :landscape)
    #pdf.image Rails.application.assets['certificate.png'], :at => [-36,756]
    #send_data pdf.render, :filename => "AAFCertificate.pdf", :type => "application/pdf"


    promise_text = "THIS CERTIFIES THAT ONE ACRE OF AMAZON RAIN FOREST AT THE CORDINATES BELOW HAS BEEN NAMED"


    holder_name = params[:certificate_holder_name]
    pdf = Prawn::Document.new(:template => "#{Rails.root}/app/assets/images/certificate_template.pdf")
    pdf.fill_color "FFFFFF"

    pdf.bounding_box([-2,195], :width=>300, :height=>250) do
      #pdf.text "Thanks To", :size => 7, :leading => 0, :align => :center
    end

    pdf.bounding_box([-2,185], :width=>300, :height=>250) do
      pdf.text "ACRE CARE CERTIFICATE", :size => 16, :leading => 0, :align => :center, :style=> :bold,:font=>"Verdana"
    end

    pdf.bounding_box([-2,150], :width=>300, :height=>250) do
       pdf.text promise_text, :size => 10, :leading => 0, :align => :center
    end

    pdf.bounding_box([-2,110], :width=>300, :height=>250) do
      pdf.text params[:certificate_holder_name].split(' ').map {|w| w.capitalize }.join(' '), :size => 14, :leading => 0, :align => :center#, :style=> :italic
    end


    pdf.bounding_box([-2,50], :width=>300, :height=>250) do
       pdf.text "REGION: ANDIAN CAT HABITAT", :size => 12, :leading => 0, :align => :center
    end
    pdf.bounding_box([-2,30], :width=>300, :height=>250) do
       pdf.text "CORDINATES:", :size => 12, :leading => 0, :align => :center
    end

    pdf.bounding_box([-2,10], :width=>300, :height=>250) do
      pdf.text "The Amazon Aid Foundation and mother earth appreciate your support and protection of this precious region", :size => 8, :leading => 0, :align => :center
    end

    pdf.bounding_box([-2,-20], :width=>300, :height=>250) do
       pdf.text "The Amazon Aid Foundation is a 501(c)(3) nonprofit organzation.", :size => 8, :leading => 0, :align => :center
    end


    send_data pdf.render, :filename => "AAFCertificate.pdf", :type => "application/pdf"

  end


end
