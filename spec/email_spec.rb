require "/Users/dinesh/project/invoice/models/email.rb"

describe Email do
  before(:each) do
    @pony = Email.new("dineshgowthamparthap@gmail.com", "dinesh@activesphere.com", "pony", "this is from ruby pony_mail")
  end
  it "should initialize the mail content" do
    @pony.should_not be_nil
  end
  
  it "should sent the mail" do
    @pony.send_email?.should be_true
	end
	
	it "should check the from address" do
    @pony.from.should eq("dineshgowthamparthap@gmail.com")
  end
  
  it "should not check the from address" do
    @pony.from.should_not eq("dineshgowthamparthap@gmai.com")
  end
  
end