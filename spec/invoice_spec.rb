require "/Users/dinesh/invoice/models/invoice"
require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/buyer.rb"

describe Invoice do
  
  it "should initialize the invoice" do
    invoice = Invoice.new(1, '22.3.2011')
    invoice.should_not be_nil
  end
  
  
  it "should check the total score" do
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should eq(360)
  end
  
  it "should check the total score not be same" do
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should_not eq(370)
  end

  it "should check the total score with seller and buyer" do
    seller = Seller.new("aa", "xxxx,yyyy,bangalore,23456.")
    buyer = Buyer.new("bb", "xxxx,yyyy,bangalore,23456.")
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should eq(360)
    buyer.agent_name.should eq("bb")
    seller.agent_name.should eq("aa")
  end
  
  it "should check the total score with seller and buyer are not same" do
    seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
    buyer = Buyer.new("bbb", "xxxx,yyyy,bangalore,23456.")
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should_not eq(370)
    buyer.agent_name.should_not eq("bb")
    seller.agent_name.should_not eq("aa")
  end
  
  it "should check the total score with seller and buyer, make the payment as paid" do
    seller = Seller.new("aa", "xxxx,yyyy,bangalore,23456.")
    buyer = Buyer.new("bb", "xxxx,yyyy,bangalore,23456.")
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should eq(360)
    buyer.agent_name.should eq("bb")
    seller.agent_name.should eq("aa")
    invoice.make_payement(360).should eq('paid_invoice')
  end

  it "should check the total score with seller and buyer, make the payment as un_paid" do
    seller = Seller.new("aa", "xxxx,yyyy,bangalore,23456.")
    buyer = Buyer.new("bb", "xxxx,yyyy,bangalore,23456.")
    invoice = Invoice.new(1, '22.3.2011')
    invoice.add_product(1, 'AAAA', 4, 40, 3)
    invoice.add_product(1, 'AA', 4, 40, 6)
    invoice.calculate_total_product_price.should eq(360)
    buyer.agent_name.should eq("bb")
    seller.agent_name.should eq("aa")
    invoice.make_payement(0).should eq('un_paid_invoice')
  end
  
  it "should check the total score with seller and buyer, make the payment as partial_paid" do
     seller = Seller.new("aa", "xxxx,yyyy,bangalore,23456.")
     buyer = Buyer.new("bb", "xxxx,yyyy,bangalore,23456.")
     invoice = Invoice.new(1, '22.3.2011')
     invoice.add_product(1, 'AAAA', 4, 40, 3)
     invoice.add_product(1, 'AA', 4, 40, 6)
     invoice.calculate_total_product_price.should eq(360)
     buyer.agent_name.should eq("bb")
     seller.agent_name.should eq("aa")
     invoice.make_payement(1).should eq('partial_paid_invoice')
     invoice.remaining_payment_for_partial_payment().should eq(359)
   end
   
   it "should check the total score with seller and buyer, make the payment as nil" do
     seller = Seller.new("aa", "xxxx,yyyy,bangalore,23456.")
     buyer = Buyer.new("bb", "xxxx,yyyy,bangalore,23456.")
     invoice = Invoice.new(1, '22.3.2011')
     invoice.add_product(1, 'AAAA', 4, 40, 3)
     invoice.add_product(1, 'AA', 4, 40, 6)
     invoice.calculate_total_product_price.should eq(360)
     buyer.agent_name.should eq("bb")
     seller.agent_name.should eq("aa")
     invoice.make_payement(nil).should eq(nil)
   end
   
end
