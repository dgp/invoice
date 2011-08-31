require "/Users/dinesh/invoice/models/invoice"
require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/buyer.rb"

describe Invoice do
  before(:each) do
    @invoice = Invoice.new(1, '2011-03-21')
    @invoice.add_product(1, 'AAAA', 4, 40, 3)
    @invoice.add_product(1, 'AA', 4, 40, 6)  
    calculate_total_product_price     
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
   
  it "should initialize the seller and buyer name" do
   @invoice.set_seller('name', 'select_address')
   @invoice.set_buyer('buyer', 'buyer_address')
   @invoice.seller.name.should eq('name')
   @invoice.buyer.name.should eq('buyer')
 end
   
 
end
