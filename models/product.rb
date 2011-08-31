class Product
  attr_reader :sq_no, :name, :no_of_team_member, :hours_worked, :payment_per_hour, :price
  def initialize(sq_no, name, no_of_team_member, hours_worked, payment_per_hour, price)
    @products = [ ]
    @sq_no = sq_no
    @name = name
    @no_of_team_member = no_of_team_member
    @hours_worked = hours_worked
    @payment_per_hour = payment_per_hour
    @price = price
  end
  
  def length
    @products.length
  end
  
  
end