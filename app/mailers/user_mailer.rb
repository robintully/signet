class UserMailer < ApplicationMailer
  default from: "signet.applicaiton@gmail.com"

  def registration_confirmation(user)
    @user = user
    email_with_name = %("#{user.name}" <#{user.email_address}>)
    mail(to: email_with_name, subject: "Registration confirmation for Signet")
  end

end
