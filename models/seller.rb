require File.dirname(__FILE__) + '/agent'

class Seller < Agent
  attr_reader :invoices
  
  def initialize(name, address)
    @invoices = []
    super(name, address)
  end
  
  def add_invoice(invoice)
    @invoices.push(invoice)
  end
  
  def invoice_raised
    @invoices.count
  end

end