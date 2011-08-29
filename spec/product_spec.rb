require "/Users/dinesh/invoice/models/product.rb"

describe Product do
  it "should initialize the products" do
    product = Product.new(1, 4, 40, 30)
    product.should_not be_nil
  end
  
  it "should price be same" do
    product = Product.new(1, 4, 40, 30)
    product.price.should eq(1200)
  end
  
  it "should price not be same" do
    product = Product.new(1, 4, 40, 30)
    product.price.should_not eq(200)
  end
  
end
