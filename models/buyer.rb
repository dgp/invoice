require File.dirname(__FILE__) + '/agent'
require File.dirname(__FILE__) + '/invoice'
require 'date'

class Buyer < Agent
  attr_reader :invoices, :paid_amount, :un_paid_amount
    
  def initialize(name, address)
    @invoices = []
    @paid_amount = 0
    @un_paid_amount = 0
    super(name, address)
  end
  
  
  def add_invoice(invoice)
    @invoices.push(invoice)
  end
  
  def get_particular_month_paid_amount(particular_month)
    @invoices.each do |invoice|
      month = invoice.date.strftime("%m")
      if month.to_i == particular_month
        puts caluculate_paid_amount(invoice)
      end
    end
  end
  
  def get_invoice_till_date(date)
    date_formate = Date.strptime(date)
    @invoices.each do |invoice|
      if invoice.date <= date_formate
        caluculate_un_paid_amount(invoice)
      end
    end
  end
  
  
  def caluculate_paid_amount(invoice)
    if invoice.paid_invoice?
      @paid_amount += invoice.paid_amount
    end
  end
  
  def caluculate_un_paid_amount(invoice)
     if invoice.partially_paid?
       puts @un_paid_amount += invoice.balance_un_paid_amount
     end
   end
end
