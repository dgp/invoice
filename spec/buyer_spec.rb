require "/Users/dinesh/invoice/models/buyer.rb"

describe Buyer do
  it "should initialize the buyer name and address" do
    buyer = Buyer.new("aaa", "xxxx,yyyy,bangalore,23456.")
    buyer.buyer_name.should eq("aaa")
  end
  
  it "should initialize the buyer name and address, buyer name not exist" do
    buyer = Buyer.new("aaa", "xxxx,yyyy,bangalore,23456.")
    buyer.buyer_name.should_not eq("aa")
  end
end