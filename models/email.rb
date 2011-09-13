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
  
  def send_email
    if Pony.mail(:to => @to, :from => @from, :subject => @subject, :body => @body)
      return true
    end
  end
end