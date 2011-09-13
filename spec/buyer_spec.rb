require "/Users/dinesh/invoice/invoice/models/buyer.rb"
require "/Users/dinesh/invoice/invoice/models/invoice.rb"


# describe Buyer do
#   it "should initialize the buyer name and address" do
#     buyer = Buyer.new("aaa", "xxxx,yyyy,bangalore,23456.")
#   end
#   
#   it "should initialize the buyer name and address, buyer name not exist" do
#     buyer = Buyer.new("aaa", "xxxx,yyyy,bangalore,23456.")
#     buyer.name.should_not eq("aa")
#   end
# end

describe Buyer do
  # it_should_behave_like "a agent" 
  #     it "create an instance" do
  #     @agent = Buyer.new('dc','dscv')
  #   end
  before(:each) do
    @invoice_1 = Invoice.new(1,'2011-03-21')
    @invoice_2 = Invoice.new(2, '2011-04-21')
    @invoice_3 = Invoice.new(3, '2011-04-21')
    @buyer = Buyer.new('aaa', 'dasdsed')
    @invoice_1.add_product(1, 'AAAA', 4, 4, 3)
    @invoice_1.add_product(1, 'AA', 4, 4, 6)
    @invoice_2.add_product(1, 'AAAA', 4, 4, 3)
    @invoice_3.add_product(1, 'AA', 4, 4, 6)
    @buyer.add_invoice(@invoice_1)
    @buyer.add_invoice(@invoice_2)
    @buyer.add_invoice(@invoice_3)
    @invoice_1.calculate_total_product_price 
    @invoice_2.calculate_total_product_price 
    @invoice_3.calculate_total_product_price 
    @invoice_1.make_payement(36)
    @invoice_2.make_payement(8)
    @invoice_3.make_payement(20)
  end
  
  it "should add invoices and check for particular month" do
    @buyer.get_particular_month_paid_amount(3)
    @buyer.paid_amount.should eq(36)
  end

  it "should check for particular month but calculate un paid amount" do
    @buyer.get_particular_month_paid_amount(4)
    @buyer.paid_amount.should_not eq(13)
  end
  
  it "should check the invoice for the given date" do
    @buyer.get_invoice_till_date('2011-04-21')
    @buyer.un_paid_amount.should eq(8)
  end  
  
  it "should check the invoice for the given date but no invoice found" do
    @buyer.get_invoice_till_date('2010-04-21')
    @buyer.un_paid_amount.should eq(0)
  end  
  
end


