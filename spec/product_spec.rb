require "/Users/dinesh/project/invoice/models/product.rb"

describe Product do
  it "should initialize the products" do
    product = Product.new(1, 'AAAA', 50)
    product.should_not be_nil
  end
  
  it "should price be same" do
    product = Product.new(1, 'AAAA',120)
    product.price.should eq(120)
  end
  
  it "should price not be same" do
    product = Product.new(1, 'AAAA', 50)
    product.price.should_not eq(60)
  end
  
end
