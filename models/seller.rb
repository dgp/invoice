require File.dirname(__FILE__) + '/agent'

class Seller < Agent

   def initialize(seller_name, seller_address)
     super(seller_name, seller_address)
   end
end