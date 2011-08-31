require "/Users/dinesh/invoice/models/seller.rb"
require "/Users/dinesh/invoice/models/agent.rb"
include shared_example_group_agent.rb


# describe Seller do
#   it "should initialize the buyer name and address" do
#     seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
#     seller.name.should eq("aaa")
#   end
#   
#   it "should initialize the buyer name and address, buyer name not exist" do
#     seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
#     seller.name.should_not eq("aa")
#   end
#   
# end
# 
# 

describe Seller do
  it_should_behave_like "a seller" 
    it "seller" do
    @agent = Seller.new('dcfg','dscv')
  end
end
