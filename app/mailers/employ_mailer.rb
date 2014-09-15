class EmployMailer < ActionMailer::Base
  default :from => "noreply@blackcatsearching.com"

 def send_mail_after_create(email)
    mail :to => email, :subject => "Account Created",
    :body => "Hello User,\n\nYour account Succesfuly created\n\nThanks\n"
  end
end	