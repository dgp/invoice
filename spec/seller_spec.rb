require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/agent.rb"
include shared_example_group_agent.rb


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
     @invoice_1 = Invoice.new('aaa','2011-03-21')
     @invoice_2 = Invoice.new('aaa', '2011-04-21')
     @invoice_3 = Invoice.new('aaa', '2011-04-21')
     @seller = seller.new('aaa', 'dasdsed')
     @invoice_1.add_product(1, 'AAAA', 4, 4, 3)
     @invoice_1.add_product(1, 'AA', 4, 4, 6)
     @invoice_2.add_product(1, 'AAAA', 4, 4, 3)
     @invoice_3.add_product(1, 'AA', 4, 4, 6)
     # @seller.add_invoice(@invoice_1)
     #     @seller.add_invoice(@invoice_2)
     #     @seller.add_invoice(@invoice_3)
      end

   it "should add invoices and check for particular month" do
     @seller.get_particular_month_paid_amount(3)
     @seller.paid_amount.should eq(36)
   end 
end
