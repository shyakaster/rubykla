class ApplicationMailer < ActionMailer::Base
  default from: 'alexshyaka@rubykampala.com'
  layout 'mailer'

   def welcome_email(lead)
    @lead = lead
    @url = 'http://rubykampala.com'
    mail(to: @lead.email, subject: 'Welcome to my awesome site')
  end
end
