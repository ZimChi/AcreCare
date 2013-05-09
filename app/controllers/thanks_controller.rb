class ThanksController < ApplicationController
  def index
  end

  def download
    send_file 'public/certificate.jpg',  :filename=>"photo.jpg", :disposition => 'attachment', :x_sendfile=>true
  end

end
