require "/Users/dinesh/invoice/models/invoice"
require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/buyer.rb"

describe Invoice do
  before(:each) do
    @seller = Seller.new('name', 'select_address')
    @buyer = Buyer.new('buyer', 'buyer_address')
    @invoice = Invoice.new(1, '2011-03-21')
    @invoice_1 = Invoice.new(2,'2011-03-21')
    @invoice.set_buyer(@buyer)
    @invoice_1.set_buyer(@buyer)
    @invoice.add_product(1, 'AAAA', 4, 40, 3)
    @invoice.add_product(2, 'AA', 4, 40, 6)  
    @invoice_1.add_product(1, 'AAAA', 4, 4, 3)
    @invoice_1.add_product(2, 'AA', 4, 4, 6)  
    @buyer.add_invoice(@invoice)
    @buyer.add_invoice(@invoice_1)
    @invoice.calculate_total_product_price 
    @invoice_1.calculate_total_product_price 
    @invoice.make_payement(360)  
    @invoice_1.make_payement(36)
  end
  
  it "should initialize the invoice" do
    @invoice.should_not be_nil
  end
  
  it "should check the date of invoice" do
    @invoice.date.to_s.should eq('2011-03-21')
  end
    
  def calculate_total_product_price
    @invoice.calculate_total_product_price()
  end
  
  it "should check the total score" do
    @invoice.total_product_price.should eq(360)
  end
  
  it "should check the total score not be same" do
    @invoice.total_product_price.should_not eq(370)
  end

  it "should check the total score with seller and buyer" do
    @invoice.total_product_price.should eq(360)
  end
  
  it "should check the total score with seller and buyer are not same" do
    @invoice.total_product_price.should_not eq(370)
  end
  
  it "should check the total score with seller and buyer, make the payment as paid" do
    @invoice.make_payement(360)
    @invoice.paid_invoice?.should be_true
  end

  it "should make the payment as un_paid" do
    @invoice.make_payement(0)
    @invoice.un_paid_invoice?.should be_true
  end
  
  it "should make the payment as nil" do
    @invoice.make_payement(nil).should eq(nil)
  end
  
  it "should check the seller and buyer, make the payment as partial_paid" do
    @invoice.make_payement(1)
    @invoice.partially_paid?.should be_true
  end 
 
  it "should display who paid" do
    
    @invoice.buyer.name.should eq('buyer')
    @buyer.get_particular_month_paid_amount(3)
    @invoice.buyer.name.should eq('buyer')
  end
 
  it "should display how much paid and when " do
    @buyer.get_particular_month_paid_amount(3)
    @invoice.buyer.paid_amount.should eq(396)
    @invoice.date.to_s.should eq('2011-03-21')
  end
 
end
