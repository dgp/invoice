require "/Users/dinesh/project/invoice/models/invoice"
require "/Users/dinesh/project/invoice/models/seller.rb"
require "/Users/dinesh/project/invoice/models/buyer.rb"

describe Invoice do

  before(:each) do
    @seller = Seller.new('name', 'select_address')
    @buyer = Buyer.new('buyer', 'buyer_address')
    @invoice = Invoice.new(1, '2011-03-21')
    @invoice.buyer = @buyer
    @invoice.add_product(1, 'AAAA', 30)
    @invoice.add_product(1, 'AAAA', 60)  
    @buyer.add_invoice(@invoice)
    @invoice.make_payement(90)  
  end
  
  it "should initialize the invoice" do
    @invoice.should_not be_nil
  end
  
  it "should check the date of invoice" do
    @invoice.date.to_s.should eq('2011-03-21')
  end
        
  it "should check the total score not be same" do
    @invoice.total_product_price.should_not eq(370)
  end

  it "should check the total score with seller and buyer" do
    @invoice.total_product_price.should eq(90)
  end
  
  it "should check the total score with seller and buyer are not same" do
    @invoice.total_product_price.should_not eq(370)
  end
  
  it "should check the total score with seller and buyer, make the payment as paid" do
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
    @invoice.buyer.paid_amount.should eq(90)
    @invoice.date.to_s.should eq('2011-03-21')
  end
 
end
