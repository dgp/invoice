require "/Users/dinesh/project/invoice/models/email.rb"

describe Email do
  it "should initialize the mail content" do
    pony = Email.new("dineshgowthamparthap@gmail.com", "dinesh@activesphere.com", "hi", "d")
    pony.should_not be_nil
  end
  
  it "should sent the mail" do
    pony = Email.new("dineshgowthamparthap@gmail.com", "dinesh@activesphere.com", "hi", "d")
    pony.send_email.should be_true
	end
	
	it "should check the from address" do
	  pony = Email.new("dineshgowthamparthap@gmail.com", "dinesh@activesphere.com", "hi", "d")
    pony.from.should eq("dineshgowthamparthap@gmail.com")
  end
end