shared_examples_for "a agent" do
  describe "<<" do
    it "should initialize the name and address" do
      @agent.name.should eq("dc")
      @agent.address.should eq("dfvfv")
    end
  end
end

