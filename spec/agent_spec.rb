require "/Users/dinesh/invoice/models/Agent.rb"
require "/Users/dinesh/invoice/models/buyer.rb"
require "/Users/dinesh/invoice/models/seller.rb"
# 
# share_examples_for "a agent" do
#   it "should initialize the name and address" do
#     agent.name.should eq("aaa")
#   end
# end
# 
# describe Agent do
#   before(:each) do
#     @agent = Agent.new('aaa', 'dsensfhjneisrufn,ronj9gj')
#   end
# 
#   it_should_behave_like ""
# 
#   it "should be optionable" do
#     @employee.should respond_to(:grant_options)
#   end
# end

shared_examples_for "a agent" do
  describe "<<" do
    it "should initialize the name and address" do
      @agent.name.should eq("dc")
    end
  end
end



