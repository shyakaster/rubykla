class Contact < MailForm::Base
  append :remote_ip, :user_agent
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  validates :message,   length: { in: 15..2000 }

  def headers
    {
      subject: 'Ruby Kampala Contact Form',
      to: 'alexshyaka@therailsshop.club',
      from: %("Name and email of sender: #{name}" <#{email}>)
    }
  end
  # def self.welcome_email(lead)
  #   {
  #     @lead => lead,
  #     @url =>'http://rubykampala.com',
  #     to: 'alexshyaka@therailsshop.club',
  #     subject: 'Welcome to my awesome site'
  #   }

  # end

end
