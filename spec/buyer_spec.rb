require "/Users/dinesh/invoice/models/buyer.rb"


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
  
  it "should add invoices" do
    buyer = Buyer.new('aaa', 'dasdsed')
    buyer.add_invoice(1, '2011-03-22')
    buyer.add_invoice(1,  '2011-03-22')
    buyer.invoices.should_not be_nil
  end
  
end


