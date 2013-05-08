class UserMailer < ActionMailer::Base
  default from: "chielo@coshx.com"

  def certificate_email(user)
      mail(:to => "chielo.zimmerman@gmail.com", :subject => "Welcome to My Awesome Site")
  end

end
