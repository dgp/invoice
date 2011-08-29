require "/Users/dinesh/invoice/models/seller.rb"

describe Seller do
  it "should initialize the buyer name and address" do
    seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
    seller.agent_name.should eq("aaa")
  end
  
  it "should initialize the buyer name and address, buyer name not exist" do
    seller = Seller.new("aaa", "xxxx,yyyy,bangalore,23456.")
    seller.agent_name.should_not eq("aa")
  end
  
end