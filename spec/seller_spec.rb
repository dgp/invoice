require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/agent.rb"
require "/Users/dinesh/invoice/models/invoice.rb"


# describe Seller do
#   it "should initialize the seller name and address" do
#     seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
#     seller.name.should eq("aaa")
#   end
#   
#   it "should initialize the seller name and address, seller name not exist" do
#     seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
#     seller.name.should_not eq("aa")
#   end
#   
# end
# 
# 

describe Seller do
  before(:each) do
    @seller_1 = Seller.new('seller_1', 'sxas')
    @seller_2 = Seller.new('seller_2', 'sxas')
    @invoice_1 = Invoice.new(1, '2011-03-21')
    @invoice_2 = Invoice.new(2, '2011-04-21')
    @invoice_3 = Invoice.new(3, '2011-04-21')
    @seller_1.add_invoice(@invoice_1)
    @seller_1.add_invoice(@invoice_2)
    @seller_1.add_invoice(@invoice_3)    
    @seller_2.add_invoice(@invoice_1)
    @seller_2.add_invoice(@invoice_2)
  end

   it "should check how many invoice raised for a seller" do
     @seller_1.name.should eq("seller_1")
     @seller_1.invoice_raised.should eq(3)
   end 
  
   it "should check how many invoice raised for a seller" do
     @seller_2.name.should eq("seller_2")
     @seller_2.invoice_raised.should eq(2)
   end 
   
   it "should not check how many invoice raised for a seller " do
      @seller_2.name.should_not eq("seller2")
      @seller_2.invoice_raised.should_not eq(3)
    end 
   
   
end
