require 'rubygems'
require 'pony'

class Email
  attr_reader :from, :to, :subject, :body
  
  def initialize(from, to, subject, body)
    @from = from
    @to = to
    @subject = subject
    @body = body
  end
  
  def send_email?
      Pony.mail(:to => @to, :subject => @subject, :body => @body, :via => :smtp, :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'dineshgowthamprathap@gmail.com',
        :password             => 'Manoharan',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      })
  end
  
end