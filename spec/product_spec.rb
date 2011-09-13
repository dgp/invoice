require "/Users/dinesh/invoice/invoice/models/product.rb"

describe Product do
  before(:each) do
    @product = Product.new(1, 'AAAA', 20)
  end
  it "should initialize the products" do
    @product.should_not be_nil
  end
  
  it "should price be same" do
    @product.price.should eq(20)
  end
  
  it "should price not be same" do
    @product.price.should_not eq(200)
  end
    
end
