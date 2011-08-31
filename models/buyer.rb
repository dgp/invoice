require File.dirname(__FILE__) + '/agent'
require File.dirname(__FILE__) + '/invoice'
require 'date'

class Buyer < Agent
  attr_reader :invoices, :paid_amount
    
  def initialize(name, address)
    @invoices = []
    @paid_amount = 0
    super(name, address)
  end
  
  
  def add_invoice(invoice)
    @invoices.push(invoice)
  end
  
  def get_particular_month_paid_amount(particular_month)
    @invoices.each do |invoice|
      month = invoice.date.strftime("%m")
      if month.to_i == particular_month
        invoice.paid_invoice?
         puts @paid_amount += invoice.paid_amount
      end
    end
  end
end
