require "/Users/dinesh/project/invoice/models/buyer.rb"
require "/Users/dinesh/project/invoice/models/invoice.rb"

describe Buyer do

  before(:each) do
    @invoice_1 = Invoice.new(1,'2011-03-21')
    @invoice_2 = Invoice.new(2, '2011-04-21')
    @invoice_3 = Invoice.new(3, '2011-03-21')
    @buyer = Buyer.new('d', 'bang')
    @invoice_1.add_product(1, 'AAAA', 30)
    @invoice_1.add_product(1, 'AA', 60)
    @invoice_2.add_product(1, 'AAAA', 30)
    @invoice_3.add_product(1, 'AA', 30)
    @buyer.add_invoice(@invoice_1)
    @buyer.add_invoice(@invoice_2)
    @buyer.add_invoice(@invoice_3)
    @invoice_1.total_product_price 
    @invoice_2.total_product_price 
    @invoice_3.total_product_price 
    @invoice_1.make_payement(90)
    @invoice_2.make_payement(8)
    @invoice_3.make_payement(30)
  end
  
  it "should add invoices and check for paid amount for particular month" do
    @buyer.get_particular_month_paid_amount(3)
    @buyer.paid_amount.should eq(120)
  end

  it "should calculate paid amount for particular month but no product avaliable" do
    @buyer.get_particular_month_paid_amount(4)
    @buyer.paid_amount.should_not eq(13)
  end
  
  it "should check the invoice for the given date" do
    @buyer.get_invoice_till_date('2011-04-21')
    @buyer.un_paid_amount.should eq(22)
  end  
  
  it "should no invoice found on given date" do
    @buyer.get_invoice_till_date('2010-04-21')
    @buyer.un_paid_amount.should eq(0)
  end  
  
end


