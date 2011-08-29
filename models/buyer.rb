class Buyer
  attr_reader :buyer_name, :buyer_address
  
  def initialize(buyer_name, buyer_address)
    @buyer_name = buyer_name
    @buyer_address = buyer_address
  end 
  
end