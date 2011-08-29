require "/Users/dinesh/invoice/models/Agent.rb"

describe Agent do
  it "should initialize the agent name and address" do
    agent = Agent.new("aaa", "xxxx,yyyy,bangalore,23456.")
    agent.agent_name.should eq("aaa")
  end
  
  it "should initialize the agent name and address, buyer name not exist" do
    agent = Agent.new("aaa", "xxxx,yyyy,bangalore,23456.")
    agent.agent_name.should_not eq("aa")
  end  
end