require File.dirname(__FILE__) + '/agent'

class Buyer < Agent

  def initialize(buyer_name, buyer_address)
    super(buyer_name, buyer_address)
  end 
  
end