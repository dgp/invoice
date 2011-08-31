require File.dirname(__FILE__) + '/agent'
require File.dirname(__FILE__) + '/invoice'
require 'date'

class Buyer < Agent
  attr_reader :invoices, :date
    
  def initialize(name, address)
    @invoices = []
    super(name, address)
  end
  
  
  def add_invoice(number, date)
    date_for = Date.strptime(date).to_s
    puts date_for
    @invoices.push(Invoice.new(number, date_for))
    get_month
  end
  
  def get_month
    
  end
  end
end
