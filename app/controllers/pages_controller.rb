class PagesController < ApplicationController
  def thanks
  end

  def about
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def certificate
    send_file 'public/certificate.jpg',  :filename=>"photo.jpg", :disposition => 'attachment', :x_sendfile=>true
  end

end
